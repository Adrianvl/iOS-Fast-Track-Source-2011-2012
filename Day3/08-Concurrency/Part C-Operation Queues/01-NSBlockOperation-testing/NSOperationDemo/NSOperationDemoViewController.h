//
//  NSOperationDemoViewController.h
//  NSOperationDemo
//
//  Created by Nicholas Outram on 20/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSOperationDemoViewController : UIViewController {
    UIButton *startButton;
    UIButton *pauseButton;
    UIButton *stopButton;
    UIProgressView *task1AProgressBar;
    UIProgressView *task1BProgressBar;
    UIProgressView *task2AProgressBar;
    UIProgressView *task3AProgressBar;
    
    BOOL started;
}


@property (nonatomic, retain) IBOutlet UIButton *startButton;
@property (nonatomic, retain) IBOutlet UIButton *pauseButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;
@property (nonatomic, retain) IBOutlet UIProgressView *task1AProgressBar;
@property (nonatomic, retain) IBOutlet UIProgressView *task1BProgressBar;
@property (nonatomic, retain) IBOutlet UIProgressView *task2AProgressBar;
@property (nonatomic, retain) IBOutlet UIProgressView *task3AProgressBar;

@property (nonatomic, assign) BOOL started;

- (IBAction)doStartButton:(id)sender;
- (IBAction)doPauseButton:(id)sender;
- (IBAction)doStopButton:(id)sender;


@end
