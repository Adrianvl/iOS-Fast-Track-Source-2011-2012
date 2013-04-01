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
    [super dealloc];
}

- (IBAction)doIterate:(id)sender {
    
    //Validate the text boxes
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
     
    //Dismiss the keyboard
    [self.outerloopTextField resignFirstResponder];
    [self.innerloopTextField resignFirstResponder];
    
    //Set UI State
    [self.activityMonitor startAnimating];
    self.iterateButton.enabled = NO;
    self.cancelButton.enabled = YES;
    
    //Perform (blocking) function
    long double M = (long double)(self.Nouter-1);
    for (long long j=0; j<self.Nouter; j++) {
        
        for (long long k=0; k<self.Ninner; k++) {
            usleep(1000);   //1ms delay
        }
        self.progressView.progress = (long double)j/M;
    }
    
    //Update UI State
    [self.activityMonitor stopAnimating];
    self.iterateButton.enabled = YES;
    self.cancelButton.enabled = NO;
    
    
}

//Event handler for the cancel button
- (IBAction)doCancel:(id)sender {
    [self.outerloopTextField resignFirstResponder];
    [self.innerloopTextField resignFirstResponder];
    
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    //Dismiss keyboard when return is touched
    [textField resignFirstResponder];
    return YES;
}

@end
