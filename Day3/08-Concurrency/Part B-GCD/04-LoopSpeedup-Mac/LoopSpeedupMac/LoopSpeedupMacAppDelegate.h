//
//  LoopSpeedupMacAppDelegate.h
//  LoopSpeedupMac
//
//  Created by Nicholas Outram on 20/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LoopSpeedupMacAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    NSTextField *outerloopTextField;
    NSTextField *innerloopTextField;
    NSButton *iterateButton;
    NSButton *cancelButton;
    NSProgressIndicator *activityMonitor;
    NSProgressIndicator *progressView;
    NSButton *concurrentSwitch;
    
    long long Nouter;
    long long Ninner;
    BOOL isCanceled;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *outerloopTextField;
@property (assign) IBOutlet NSTextField *innerloopTextField;
@property (assign) IBOutlet NSButton *iterateButton;
@property (assign) IBOutlet NSButton *cancelButton;
@property (assign) IBOutlet NSProgressIndicator *activityMonitor;
@property (assign) IBOutlet NSProgressIndicator *progressView;
@property (assign) IBOutlet NSButton *concurrentSwitch;

@property(nonatomic, assign) long long Nouter;
@property(nonatomic, assign) long long Ninner;
@property(assign)            BOOL isCanceled;   //This one is atomic

- (IBAction)doIterate:(id)sender;
- (IBAction)doCancel:(id)sender;

@end
