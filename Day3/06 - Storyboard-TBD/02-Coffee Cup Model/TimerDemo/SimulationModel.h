//
//  SimulationModel.h
//  TimerDemo
//
//  Created by Nicholas Outram on 02/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class InitialConditionsModel;

#define kEpoch 0.1  //Time is seconds between model updates

#define kConductivityForMetal 0.001
#define kConductivityForCeramic 0.0005
#define kConductivityForPlastic 0.0001

#define kMaterialTypePlastic 0
#define kMaterialTypeCeramic 1
#define kMaterialTypeMetal   2

@interface SimulationModel : NSObject 

@property (readwrite, nonatomic, strong) InitialConditionsModel *initialConditions;
@property (readwrite, nonatomic, strong) NSNumber* currentTemperature;
@property (readwrite, nonatomic, strong) NSNumber* k;                                       //Material coefficient
@property (readwrite, nonatomic, strong) NSNumber* ambientTemperature;
@property (readonly,  nonatomic, strong) NSArray* arrayOfMaterialCoefficients;
@property (readwrite, nonatomic, strong) NSNumber *materialType;

-(void)iterateWithDelta:(NSNumber*)deltaT;
-(void)reset;

@end
