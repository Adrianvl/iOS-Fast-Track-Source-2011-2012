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

//Accessors
-(NSString*) personName;
-(void)setPersonName:(NSString*)anotherName;
-(NSUInteger)age;
-(void)setAge:(NSUInteger)anotherAge;
-(float)weightInKg;
-(void)setWeightInKg:(float)anotherWeight;
-(float)heightInM;
-(void)setHeightInM:(float)anotherHeight;
-(PERSON_GENDER)gender;
-(void)setGender:(PERSON_GENDER)anotherGender;

//Derived accessors
-(float)bmi;

@end
