//
//  Model.m
//  DeepCopy
//
//  Created by Nicholas Outram on 15/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Model.h"


@implementation Model

@synthesize firstName = _firstName;
@synthesize age = _age;
@synthesize arrayOfChildrenNames = _children;

-(id)init
{
    self = [super init];
    if (self) {
        self.age = [NSNumber numberWithInt:22];
        self.firstName = @"Jim";
        self.arrayOfChildrenNames = [NSMutableArray array];
    }
    return self;
}

//Conform to the protocol NSCopying
//This is going to be a FUNCTIONAL COPY (combination of deep and shallow)
- (id)copyWithZone:(NSZone *)zone
{
    Model *newModel = [[Model alloc] init];
    newModel.age = self.age;
    newModel.firstName = self.firstName;
    newModel.arrayOfChildrenNames = self.arrayOfChildrenNames;  //Here is the bug
//    newModel.arrayOfChildrenNames = [self.arrayOfChildrenNames mutableCopy]; //The correct way 
    return newModel;
}


-(NSString*)description
{
    NSString *desc = [NSString stringWithFormat:@"Name %@ , Age %@, Children: %@", self.firstName, self.age, self.arrayOfChildrenNames];
    return desc;
}

@end
