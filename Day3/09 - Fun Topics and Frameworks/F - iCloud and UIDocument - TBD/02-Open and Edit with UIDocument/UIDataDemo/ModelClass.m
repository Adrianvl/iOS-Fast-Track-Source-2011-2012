//
//  ModelClass.m
//  UIDataDemo
//
//  Created by Nicholas Outram on 11/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ModelClass.h"

@implementation ModelClass
@synthesize name, age;


- (id)contentsForType:(NSString *)typeName error:(NSError **)outError
{
    NSData *data;
    NSDictionary *dictofData = [NSDictionary dictionaryWithObjectsAndKeys:
                                self.name, @"name",
                                self.age, @"age",
                                nil];
    
    data = [NSKeyedArchiver archivedDataWithRootObject:dictofData];
    return data;
}

- (BOOL)loadFromContents:(id)contents ofType:(NSString *)typeName error:(NSError **)outError
{
    NSDictionary *dictOfdata = [NSKeyedUnarchiver unarchiveObjectWithData:contents];
    self.name = [dictOfdata objectForKey:@"name"];
    self.age  = [dictOfdata objectForKey:@"age"];
    return YES;
}

@end
