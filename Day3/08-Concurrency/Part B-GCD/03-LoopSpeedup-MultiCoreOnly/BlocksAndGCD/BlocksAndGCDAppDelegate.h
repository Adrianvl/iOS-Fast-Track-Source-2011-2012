//
//  BlocksAndGCDAppDelegate.h
//  BlocksAndGCD
//
//  Created by Nicholas Outram on 19/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlocksAndGCDAppDelegate : NSObject <UIApplicationDelegate, UITextFieldDelegate> {
    UITextField *_outerloopTextField;
    UITextField *_innerloopTextField;
    UIButton *_iterateButton;
    UIButton *_cancelButton;
    UIActivityIndicatorView *_activityMonitor;
    UIProgressView *_progressView;
    UISwitch *_concurrentSwitch;
    
    long long Nouter;
    long long Ninner;
    BOOL isCanceled;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITextField *outerloopTextField;
@property (nonatomic, retain) IBOutlet UITextField *innerloopTextField;
@property (nonatomic, retain) IBOutlet UIButton *iterateButton;
@property (nonatomic, retain) IBOutlet UIButton *cancelButton;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityMonitor;
@property (nonatomic, retain) IBOutlet UIProgressView *progressView;
@property (nonatomic, retain) IBOutlet UISwitch *concurrentSwitch;

@property(nonatomic, assign) long long Nouter;
@property(nonatomic, assign) long long Ninner;
@property(assign)            BOOL isCanceled;   //This one is atomic


- (IBAction)doIterate:(id)sender;
- (IBAction)doCancel:(id)sender;

@end
