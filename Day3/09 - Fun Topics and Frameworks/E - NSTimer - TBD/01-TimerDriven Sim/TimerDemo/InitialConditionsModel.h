//
//  InitialConditionsModel.h
//  TimerDemo
//
//  Created by Nicholas Outram on 02/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimulationModel.h"

@interface InitialConditionsModel : NSObject {
    
}

@property(readwrite, nonatomic, strong) NSNumber *ambientTemperature;
@property(readwrite, nonatomic, strong) NSNumber *initialTemperature;


@end
