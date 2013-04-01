//
//  MyWindow.m
//  ResponderTest
//
//  Created by Nicholas Outram on 13/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "MyWindow.h"

@implementation MyWindow

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSLog(@"WINDOW received touch event from %@", NSStringFromClass([[touch view] class]) );
    
    //Call the superclass to feed up the responder chain
    [super touchesBegan:touches withEvent:event];
}

@end
