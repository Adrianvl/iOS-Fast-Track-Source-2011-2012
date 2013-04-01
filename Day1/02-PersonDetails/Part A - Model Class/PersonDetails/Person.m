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

- (id)init {
    self = [super init];
    if (self) {
        personName = @"Person";
        age = 18;
        weightInKg = 65.0;
        heightInM = 1.6;
        gender = MALE;
    }
    return self;
}

- (void)dealloc {
    personName = nil;
    [super dealloc];
}

@end
