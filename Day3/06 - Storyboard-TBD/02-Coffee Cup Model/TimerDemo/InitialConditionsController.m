//
//  ParameterController.m
//  TimerDemo
//
//  Created by Nicholas Outram on 02/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "InitialConditionsController.h"

@implementation InitialConditionsController {

}

@synthesize initialTemperatureStepper;
@synthesize ambientTemperatureStepper;
@synthesize initialTemperaureLabel;
@synthesize ambientTemperatureLabel;

@synthesize delegate;
@synthesize initialConditions = _initialConditions;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
}


- (void)viewDidUnload
{
    [self setInitialTemperatureStepper:nil];
    [self setAmbientTemperatureStepper:nil];
    [self setInitialTemperaureLabel:nil];
    [self setAmbientTemperatureLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)doInitialTemperatureStepperTouched:(id)sender {
    self.initialConditions.initialTemperature = [NSNumber numberWithDouble:self.initialTemperatureStepper.value];
    [self updateUI];
}

- (IBAction)doAmbientTemperatureStepperTouched:(id)sender {
    self.initialConditions.ambientTemperature = [NSNumber numberWithDouble:self.ambientTemperatureStepper.value];
    [self updateUI];
}


-(void)updateUI
{
    //Update the GUI
    self.initialTemperatureStepper.value = [self.initialConditions.initialTemperature doubleValue];
    self.ambientTemperatureStepper.value = [self.initialConditions.ambientTemperature doubleValue];
    self.initialTemperaureLabel.text  = [NSString stringWithFormat:@"%2.1f", [self.initialConditions.initialTemperature doubleValue]];
    self.ambientTemperatureLabel.text = [NSString stringWithFormat:@"%2.1f", [self.initialConditions.ambientTemperature doubleValue]];
    
    //Send updates back to the controller lower down the stack
    [delegate updateParametersWithInitialConditions:self.initialConditions];
}

#pragma mark - Accessors
//Accessors (lazy loading - self initialising)
-(InitialConditionsModel*)initialConditions
{
    if (_initialConditions == nil) {
        self.initialConditions = [delegate initialConditions];
    }
    return _initialConditions;
}
@end
