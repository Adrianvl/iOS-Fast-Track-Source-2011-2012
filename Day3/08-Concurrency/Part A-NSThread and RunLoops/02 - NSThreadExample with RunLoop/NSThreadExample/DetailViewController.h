//
//  ViewController.h
//  NSThreadExample
//
//  Created by Nicholas Outram on 24/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<NSPortDelegate>

//Properties for UI
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar1;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar2;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator1;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIStepper *stepper1;
@property (weak, nonatomic) IBOutlet UIStepper *stepper2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (nonatomic, copy) void(^callBackBlock)(BOOL showButton); 

//Properties for thread 1
@property (strong, readwrite, nonatomic) NSThread* thread1;
@property (readwrite) BOOL thread1Finished;

//Methods for UI Update
-(void)updateActivityIndicator;

//Actions
- (IBAction)doButton1:(id)sender;
- (IBAction)doButton2:(id)sender;
- (IBAction)doStepper1:(id)sender;
- (IBAction)doStepper2:(id)sender;

//Thread creation, monitoring and tasks
-(void)setupRunLoop1:(id)obj;
-(void)beginTask1:(id)obj;
-(void)doMassiveTask1:(id)obj;
-(void)doMassiveTask2:(id)obj;
-(void)watchDog1:(NSTimer*)tmr;

//Call backs on main thread
-(void)callBack1:(id)obj;
-(void)callBack2:(id)obj;
-(void)logOnMainThread:(NSString*)message;
-(void)callBackWhenRunLoopIsDone:(id)obj;

@end
