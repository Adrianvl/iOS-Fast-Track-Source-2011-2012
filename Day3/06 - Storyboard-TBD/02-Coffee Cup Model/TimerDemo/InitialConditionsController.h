//
//  ParameterController.h
//  TimerDemo
//
//  Created by Nicholas Outram on 02/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InitialConditionsModel.h"

@protocol InitialConditionsControllerProtocol <NSObject>
@required
-(void)updateParametersWithInitialConditions:(InitialConditionsModel*)ic;
-(InitialConditionsModel*)initialConditions;
@end

@interface InitialConditionsController : UIViewController
@property (weak, nonatomic) IBOutlet UIStepper *initialTemperatureStepper;
@property (weak, nonatomic) IBOutlet UIStepper *ambientTemperatureStepper;
@property (weak, nonatomic) IBOutlet UILabel *initialTemperaureLabel;
@property (weak, nonatomic) IBOutlet UILabel *ambientTemperatureLabel;
@property (weak, nonatomic) id<InitialConditionsControllerProtocol> delegate;  

@property (strong, nonatomic) InitialConditionsModel* initialConditions;

- (IBAction)doInitialTemperatureStepperTouched:(id)sender;
- (IBAction)doAmbientTemperatureStepperTouched:(id)sender;

-(void)updateUI;
@end
