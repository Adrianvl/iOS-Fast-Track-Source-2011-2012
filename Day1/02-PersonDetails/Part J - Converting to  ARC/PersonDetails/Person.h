//
//  Person.h
//  PersonDetails
//
//  Created by Nicholas Outram on 28/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import <Foundation/Foundation.h>

//Create a custom enumerated type
typedef enum {
    FEMALE, MALE
} PERSON_GENDER;

@interface Person : NSObject<NSCoding>

//Initialisation
- (id) initWithName:(NSString *)pName gender:(PERSON_GENDER)gen;

//Class methods
+(float)calculateBodyMassIndexGivenWeight:(float)weight andHeight:(float)height;
+(Person*)personWithName:(NSString *)pName gender:(PERSON_GENDER)gen;

//Properties (replacing the manual setters and getters)
@property (readwrite, nonatomic, copy) NSString *personName;
@property (readwrite, nonatomic, assign) NSUInteger age;
@property (readwrite, nonatomic, assign) float weightInKg;
@property (readwrite, nonatomic, assign) float heightInM;
@property (readwrite, nonatomic, assign) PERSON_GENDER gender;

//Derived accessors
-(float)bmi;

@end
