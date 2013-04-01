//
//  SimController.m
//  TimerDemo
//
//  Created by Nicholas Outram on 02/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SimController.h"

// Category on NSNumber
// This adds a method to the NSNumber class
// Note - you cannot add iVars, only methods
@interface NSNumber (NSNumberUOPCategory)  
-(NSNumber*)numberWithIncrementedLongValue;    
@end
@implementation NSNumber (NSNumberUOPCategory)
-(NSNumber*)numberWithIncrementedLongValue {
    return [NSNumber numberWithLong:([self longValue]+1)];
}
@end

//Anonymous category (used here to create private properties)
@interface SimController ()
@property (readwrite, nonatomic, strong) NSNumber* totalEpochs;
@end


@implementation SimController {

}
@synthesize model = _model;
@synthesize temperatureLabel;
@synthesize epochLabel = _epochLabel;
@synthesize timer = _timer;
@synthesize previousDate = _previousDate;
@synthesize currentDate = _currentDate;
@synthesize totalEpochs = _totalEpochs;

//This isn't going to get called by storyboard
//Therefore I'm going to initialise via lazy loading
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    double t = [self.model.initialConditions.initialTemperature doubleValue];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%3.1f",t];
}

-(void)updateViewWithModel
{
    double t = [self.model.currentTemperature doubleValue];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%3.1f",t];
    
    //Update epoch display
    self.totalEpochs = [self.totalEpochs numberWithIncrementedLongValue];
    self.epochLabel.text = [NSString stringWithFormat:@"%@", self.totalEpochs];
}

- (void)viewDidUnload
{
    [self setTemperatureLabel:nil];
    [self setEpochLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions
- (IBAction)doStartButton:(id)sender {
    self.previousDate = [NSDate date];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kEpoch target:self selector:@selector(doEpoch:) userInfo:nil repeats:YES];        
}

- (IBAction)soStopButton:(id)sender {
    [self.timer invalidate];
    [self.model reset];
    self.timer = nil;
    [self updateViewWithModel];
}

- (IBAction)doBlockMainThread:(id)sender {
    for (unsigned int p=0; p<10000; p++) {
        for (unsigned int q=0; q<100000; q++) {
                //DO NOTHING
        }
    }
}

-(void)doEpoch:(NSTimer*)t
{
    self.currentDate = [NSDate date];
    double deltaT = [self.currentDate timeIntervalSinceDate:self.previousDate];
    self.previousDate = [NSDate date];
    [self.model iterateWithDelta:[NSNumber numberWithDouble:deltaT]];
    [self updateViewWithModel];
}

#pragma mark - accessors
-(SimulationModel*)model {
    if (_model == nil) {
        _model = [[SimulationModel alloc] init];
    }
    return _model;
}
-(NSNumber*)totalEpochs {
    if (_totalEpochs == nil) {
        _totalEpochs = [NSNumber numberWithInt:0];
    }
    return _totalEpochs;
}
@end