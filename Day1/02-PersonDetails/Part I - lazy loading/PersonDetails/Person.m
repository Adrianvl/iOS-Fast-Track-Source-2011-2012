//
//  Person.m
//  PersonDetails
//
//  Created by Nicholas Outram on 28/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "Person.h"

@implementation Person {
    
    //Model data members - this is no longer needed
//    NSString *personName;
//    NSUInteger age;
//    float weightInKg;
//    float heightInM;
//    PERSON_GENDER gender;
}

@synthesize personName = _personName;
@synthesize age, weightInKg, heightInM, gender;

//Default initialiser
- (id) init
{
    //call designated initialiser with defaults
    return [self initWithName:@"jim" gender:MALE];
}

- (id) initWithName:(NSString *)pName  gender:(PERSON_GENDER)gen
{
    self = [super init];
    if (self) {
        age = 18;
        weightInKg = 65.0;
        heightInM = 1.6;
        
        //The string arguments passed are not guaranteed to remain in memory UNLESS this object retains or makes an indepdent copy of them
        _personName  = [pName copy];      //THESE OBJECTS NOW HAVE A RETAIN COUNT OF 1
        gender = gen;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    //Base class does not implmentent this protocol, so we don't call super
    [encoder encodeObject:self.personName forKey:@"personName"];
    [encoder encodeInt:age forKey:@"age"];
    [encoder encodeFloat:weightInKg forKey:@"weightInKg"];
    [encoder encodeFloat:heightInM forKey:@"heightInM"];
    [encoder encodeInt:gender forKey:@"gender"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
	//self = [super initWithCoder:decoder]; //Use this is the parent also conforms to NSCoding
	self = [super init];	//Designted initialiser for the parent
	if (self) {
		[self setPersonName: [decoder decodeObjectForKey:@"personName"]];     //The SETTER makes a copy of the object
		[self setAge:        [decoder decodeIntForKey:@"age"]];
		[self setWeightInKg: [decoder decodeFloatForKey:@"weightInKg"]];
		[self setHeightInM:  [decoder decodeFloatForKey:@"heightInM"]];
		[self setGender:     [decoder decodeIntForKey:@"gender"]];
    }
	return self;
}


- (void)dealloc {
    //This time there is something to do - release the objects retained by the init method
//    [self.personName release];
    self.personName = nil;
    [super dealloc];
}

//Override description
-(NSString*)description
{
    NSString *desc = [NSMutableString stringWithFormat:@"name: %@, age=%u, weight=%2.2f, height = %2.2f", self.personName, age, weightInKg, heightInM];
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
+(Person*)personWithName:(NSString *)pName gender:(PERSON_GENDER)gen
{
	Person *p = [[[Person alloc] initWithName:pName gender:gen] autorelease];
	return p;
}

//Here we create our own accessors
-(float)bmi {
    float result = [Person calculateBodyMassIndexGivenWeight:weightInKg andHeight:heightInM];
    return result;
}

@end
