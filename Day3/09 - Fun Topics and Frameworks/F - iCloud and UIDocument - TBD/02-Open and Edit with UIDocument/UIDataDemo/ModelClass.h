//
//  ModelClass.h
//  UIDataDemo
//
//  Created by Nicholas Outram on 11/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelClass : UIDocument

@property(readwrite, nonatomic, strong) NSString *name;
@property(readwrite, nonatomic, strong) NSNumber* age;

@end
