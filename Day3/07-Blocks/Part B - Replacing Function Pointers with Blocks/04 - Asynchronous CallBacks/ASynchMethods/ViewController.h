//
//  ViewController.h
//  ASynchMethods
//
//  Created by Nicholas Outram on 07/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h> 

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIButton *startButton;
@property (readwrite,nonatomic, retain) NSTimer *timer;
@property (retain, nonatomic) IBOutlet UILabel *labelOutput;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

//It is CRITICAL that the accessor sends a copy message to the iVar (which is a block) and not a retain
//Doing so ensures the block is copied to the heap so that it persists long enough to be called
@property (copy,   nonatomic) NSString*(^callBack)(void); 
//@property (assign, nonatomic) NSString*(^callBack)(void); 
//@property (retain, nonatomic) NSString*(^callBack)(void); 

- (IBAction)doButtonTouched:(id)sender;
@end
