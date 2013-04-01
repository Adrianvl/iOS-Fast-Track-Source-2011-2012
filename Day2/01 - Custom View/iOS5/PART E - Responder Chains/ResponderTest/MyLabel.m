//
//  MyLabel.m
//  ResponderTest
//
//  Created by Nicholas Outram on 11/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "MyLabel.h"

@implementation MyLabel

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSLog(@"UILABEL SUBCLASS received touch event from %@", NSStringFromClass([[touch view] class]) );
    
    //Call the superclass to feed up the responder chain
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

@end
