//
//  ViewController.h
//  NSThreadExample
//
//  Created by Nicholas Outram on 24/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar1;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar2;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator1;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UIStepper *stepper1;
@property (weak, nonatomic) IBOutlet UIStepper *stepper2;

-(void)updateActivityIndicator;

- (IBAction)doButton1:(id)sender;
- (IBAction)doButton2:(id)sender;
- (IBAction)doStepper1:(id)sender;
- (IBAction)doStepper2:(id)sender;

-(void)doMassiveTask1:(id)obj;
-(void)doMassiveTask2:(id)obj;
-(void)callBack1:(id)obj;
-(void)callBack2:(id)obj;
@end
