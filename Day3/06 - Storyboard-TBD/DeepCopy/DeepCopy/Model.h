//
//  Model.h
//  DeepCopy
//
//  Created by Nicholas Outram on 15/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//This class conforms to the protocol NSCopying
@interface Model : NSObject<NSCopying>

@property(readwrite, nonatomic, strong) NSString* firstName;
@property(readwrite, nonatomic, strong) NSNumber* age;
@property(readwrite, nonatomic, strong) NSMutableArray* arrayOfChildrenNames;

@end
