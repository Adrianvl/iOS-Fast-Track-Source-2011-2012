//
//  InitialConditionsModel.m
//  TimerDemo
//
//  Created by Nicholas Outram on 02/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "InitialConditionsModel.h"

@implementation InitialConditionsModel

@synthesize ambientTemperature = _ambientTemperature;
@synthesize initialTemperature = _initialTemperature;


#pragma mark - Accessors
//Accessors (lazy loading / self initialising)
-(NSNumber*)ambientTemperature {
    if (_ambientTemperature == nil) {
        self.ambientTemperature = [NSNumber numberWithDouble:17.0];
    }
    return _ambientTemperature;
}
-(NSNumber*)initialTemperature {
    if (_initialTemperature == nil) {
        self.initialTemperature = [NSNumber numberWithDouble:100.0];
    }
    return _initialTemperature;
}


@end
