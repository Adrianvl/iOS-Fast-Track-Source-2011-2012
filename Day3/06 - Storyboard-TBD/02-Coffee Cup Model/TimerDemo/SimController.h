//
//  SimController.h
//  TimerDemo
//
//  Created by Nicholas Outram on 02/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimulationModel.h"
#import "InitialConditionsController.h"

@interface SimController : UIViewController <InitialConditionsControllerProtocol, UIScrollViewDelegate>

@property (strong, nonatomic) SimulationModel *model;

@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewCeramic;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewMetal;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewPlastic;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSDate *previousDate;
@property (strong, nonatomic) NSDate *currentDate;

- (IBAction)doStartButton:(id)sender;
- (IBAction)soStopButton:(id)sender;
-(void)updateViewWithModel;
-(void)doEpoch:(NSTimer*)t;
@end
