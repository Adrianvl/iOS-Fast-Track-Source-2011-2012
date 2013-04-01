//
//  LoopSpeedupMacAppDelegate.m
//  LoopSpeedupMac
//
//  Created by Nicholas Outram on 20/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "LoopSpeedupMacAppDelegate.h"

@implementation LoopSpeedupMacAppDelegate

@synthesize window;
@synthesize outerloopTextField;
@synthesize innerloopTextField;
@synthesize iterateButton;
@synthesize cancelButton;
@synthesize activityMonitor;
@synthesize progressView;
@synthesize concurrentSwitch;

@synthesize Nouter, Ninner, isCanceled;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)doIterate:(id)sender {
    self.Ninner = [self.innerloopTextField.stringValue longLongValue];
    if (Ninner == 0) {
        [self.innerloopTextField becomeFirstResponder];
        return;
    }
    self.Nouter = [self.outerloopTextField.stringValue longLongValue];
    if (self.Nouter == 0) {
        [self.outerloopTextField becomeFirstResponder];
        return;
    }
    
    [self.outerloopTextField resignFirstResponder];
    [self.innerloopTextField resignFirstResponder];
    [self.activityMonitor  startAnimation:self];
    self.iterateButton.enabled = NO;
    self.cancelButton.enabled = YES;
    self.progressView.doubleValue = 0.0;
    BOOL useConcurrency = self.concurrentSwitch.state;
    
    //Create a block to be read in seperate thread
    void(^longBlock)(void) = ^(void) {
        long double M = (long double)(self.Nouter-1);
        for (long long j=0; j<self.Nouter; j++) {
            
            //Inner block
            void(^innerBlock)(size_t);
            innerBlock = ^(size_t k) {
                usleep(1000);
            };
            
            if (useConcurrency == YES) {
                //Perform concurrent loop iterations (blocking but hopefully faster where we have multi-core)
                dispatch_queue_t queue_inner = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); //Another concurrent queue
                dispatch_apply(self.Ninner, queue_inner, innerBlock); //Blocking                
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
                self.progressView.doubleValue = (long double)j/M;
            });    
            
            //Check for cancelled
            if (isCanceled == YES) {
                self.progressView.doubleValue = 0.0;
                break;
            }
        }
        
        //When finished, restore the UI
        dispatch_queue_t mQueue = dispatch_get_main_queue();
        dispatch_async(mQueue, ^(void) {
            [self.activityMonitor stopAnimation:self];
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
@end
