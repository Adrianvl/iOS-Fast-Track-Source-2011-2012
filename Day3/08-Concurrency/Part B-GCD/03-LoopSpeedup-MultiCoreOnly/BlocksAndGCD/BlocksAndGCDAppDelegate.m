//
//  BlocksAndGCDAppDelegate.m
//  BlocksAndGCD
//
//  Created by Nicholas Outram on 19/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "BlocksAndGCDAppDelegate.h"

@implementation BlocksAndGCDAppDelegate

@synthesize window = _window;
@synthesize outerloopTextField = _outerloopTextField;
@synthesize innerloopTextField = _innerloopTextField;
@synthesize iterateButton = _iterateButton;
@synthesize cancelButton = _cancelButton;
@synthesize activityMonitor = _activityMonitor;
@synthesize progressView = _progressView;
@synthesize concurrentSwitch = _concurrentSwitch;
@synthesize  isCanceled;

@synthesize Nouter, Ninner;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_outerloopTextField release];
    [_innerloopTextField release];
    [_iterateButton release];
    [_cancelButton release];
    [_activityMonitor release];
    [_progressView release];
    [_concurrentSwitch release];
    [super dealloc];
}

- (IBAction)doIterate:(id)sender {
    self.Ninner = [self.innerloopTextField.text longLongValue];
    if (Ninner == 0) {
        [self.innerloopTextField becomeFirstResponder];
        return;
    }
    self.Nouter = [self.outerloopTextField.text longLongValue];
    if (self.Nouter == 0) {
        [self.outerloopTextField becomeFirstResponder];
        return;
    }
        
    [self.outerloopTextField resignFirstResponder];
    [self.innerloopTextField resignFirstResponder];
    [self.activityMonitor startAnimating];
    self.iterateButton.enabled = NO;
    self.cancelButton.enabled = YES;
    self.progressView.progress = 0.0;
    BOOL useConcurrency = self.concurrentSwitch.on;
    
    //Create a block to be read in seperate thread
    void(^longBlock)(void) = ^(void) {
        long double M = (long double)(self.Nouter-1);
        for (long long j=0; j<self.Nouter; j++) {
            
            //Inner block
            void(^innerBlock)(size_t);
            innerBlock = ^(size_t k) {
                usleep(1000*10);
            };
            
            if (useConcurrency == YES) {
                //Perform concurrent loop iterations (blocking but hopefully faster where we have multi-core)
                dispatch_queue_t queue_inner = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); //Another concurrent queue
                dispatch_apply(self.Ninner/10, queue_inner, innerBlock); //Blocking                
            } 
            else 
            {
                //Perform loop serially as before
                for (size_t k=0; k<self.Ninner; k++) {
                    usleep(1000);
                }
            }
            
            //Update progress bar on main thread
            dispatch_queue_t mQueue = dispatch_get_main_queue();
            dispatch_sync(mQueue, ^(void) {
                self.progressView.progress = (long double)j/M;
            });    
            
            //Check for cancelled
            if (isCanceled == YES) {
                self.progressView.progress = 0.0;
                break;
            }
        }

        //When finished, restore the UI
        dispatch_queue_t mQueue = dispatch_get_main_queue();
        dispatch_async(mQueue, ^(void) {
            [self.activityMonitor stopAnimating];
            self.iterateButton.enabled = YES;
            self.cancelButton.enabled = NO;
            self.isCanceled = NO;
        } );
    };
    
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, longBlock);
    
    
    
}

- (IBAction)doCancel:(id)sender {
    self.isCanceled = YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
