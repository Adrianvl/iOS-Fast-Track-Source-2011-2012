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

@interface Person : NSObject

//Initialisation
- (id) initWithName:(NSString *)pName gender:(PERSON_GENDER)gen;

//Class methods
+(float)calculateBodyMassIndexGivenWeight:(float)weight andHeight:(float)height;

@end
