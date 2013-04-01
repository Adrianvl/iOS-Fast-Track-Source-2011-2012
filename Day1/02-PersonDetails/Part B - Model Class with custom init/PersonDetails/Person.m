//
//  Person.m
//  PersonDetails
//
//  Created by Nicholas Outram on 28/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "Person.h"

@implementation Person {
    
    //Model data members
    NSString *personName;
    NSUInteger age;
    float weightInKg;
    float heightInM;    
    PERSON_GENDER gender;
}

//Parameterless initialiser
- (id) init
{
    //call designated initialiser with defaults
    return [self initWithName:@"jim" gender:MALE];
}
//New custom initialiser
- (id) initWithName:(NSString *)pName  gender:(PERSON_GENDER)gen
{
    self = [super init];
    if (self) {
        age = 18;
        weightInKg = 65.0;
        heightInM = 1.6;
        
        //The string arguments passed are not guaranteed to remain in memory UNLESS this object retains or makes an indepdent copy of them
        personName  = [pName copy];      //THESE OBJECTS NOW HAVE A RETAIN COUNT OF 1        
        gender = gen;

    }
    return self;
}

- (void)dealloc {
    //This time there is something to do - release the objects retained by the init method
    [personName release];
    
    [super dealloc];
}

//Override description
-(NSString*)description
{
    NSString *desc = [NSMutableString stringWithFormat:@"name: %@, age=%u, weight=%2.2f, height = %2.2f", personName, age, weightInKg, heightInM];
    return desc;
}

//CLASS METHODS

+(float)calculateBodyMassIndexGivenWeight:(float)weight andHeight:(float)height
{
    //Mass / (height * height)
    if (height < 0.1) {
        [NSException raise:@"PersonClassException" format:@"Height must be at least 10cm"];
    }    
    
    float heightSquared = height * height;
    return (weight / heightSquared);
}

@end
