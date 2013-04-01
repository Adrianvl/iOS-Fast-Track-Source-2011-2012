//
//  SimulationModel.m
//  TimerDemo
//
//  Created by Nicholas Outram on 02/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SimulationModel.h"
#import "InitialConditionsModel.h"

@implementation SimulationModel
@synthesize initialConditions = _initialConditions;
@synthesize currentTemperature = _currentTemperature;
@synthesize ambientTemperature = _ambientTemperature;
@synthesize k = _k;
@synthesize arrayOfMaterialCoefficients = _arrayOfMaterialCoefficients;
@synthesize materialType = _materialType;

-(void)iterateWithDelta:(NSNumber*)deltaT
{
    double dT = -1.0*[self.k doubleValue]*([self.currentTemperature doubleValue] - [self.ambientTemperature doubleValue])*[deltaT doubleValue];
    double T  = [self.currentTemperature doubleValue] + dT;
    self.currentTemperature = [NSNumber numberWithDouble:T];
}
-(void)reset
{
    self.currentTemperature = nil;
    self.ambientTemperature = nil;
    self.k = nil;
}

#pragma mark - accessors
-(InitialConditionsModel*)initialConditions
{
    if (_initialConditions == nil) {
        _initialConditions = [[InitialConditionsModel alloc] init];
    }
    return _initialConditions;
}
-(NSNumber*)currentTemperature {
    if (_currentTemperature == nil) {
        self.currentTemperature = [NSNumber numberWithDouble:[self.initialConditions.initialTemperature doubleValue]];  //True copy
    }
    return _currentTemperature;
}
-(NSNumber*)ambientTemperature {
    if (_ambientTemperature == nil) {
        self.ambientTemperature = [NSNumber numberWithDouble:[self.initialConditions.ambientTemperature doubleValue]];
    }
    return _ambientTemperature;
}
-(NSNumber*)k
{
    if (_k == nil) {
        int intMaterial = [self.materialType intValue];
        NSNumber *materialCoeff = [self.arrayOfMaterialCoefficients objectAtIndex:intMaterial];
        self.k = [NSNumber numberWithDouble:[materialCoeff doubleValue]];
    }
    return _k;
}
-(NSArray*)arrayOfMaterialCoefficients
{
    if (_arrayOfMaterialCoefficients == nil) {
        _arrayOfMaterialCoefficients = [NSArray arrayWithObjects:   [NSNumber numberWithDouble:kConductivityForPlastic],
                                        [NSNumber numberWithDouble:kConductivityForCeramic],
                                        [NSNumber numberWithDouble:kConductivityForMetal],
                                        nil];
    }
    return _arrayOfMaterialCoefficients;
}
-(NSNumber*)materialType {
    if (_materialType == nil) {
        self.materialType = [NSNumber numberWithInt:1];
    }
    return _materialType;
}

@end
