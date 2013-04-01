//
//  MainViewController.h
//  Nibbly
//
//  Created by noutram on 08/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController1.h"
#import "ViewController2.h"


@interface MainViewController : UIViewController 

@property (readwrite, nonatomic, retain) IBOutlet UIToolbar *toolBar;
@property (readwrite, nonatomic, retain) IBOutlet UIBarButtonItem *btn1;
@property (readwrite, nonatomic, retain) IBOutlet UIBarButtonItem *btn2;

@property (readwrite, nonatomic, retain) ViewController1 *vc1;
@property (readwrite, nonatomic, retain) ViewController2 *vc2;
@property (readwrite, nonatomic, assign) UIViewController *currentSubviewController;

-(IBAction)button1Touched:(id)sender;
-(IBAction)button2Touched:(id)sender;

-(void)removeAllSubviews;
-(void)setAllButtonsToState:(BOOL)s;
-(void)animationDidStop:(NSString *)animationID 
               finished:(NSNumber *)finished 
                context:(void *)context;
@end
