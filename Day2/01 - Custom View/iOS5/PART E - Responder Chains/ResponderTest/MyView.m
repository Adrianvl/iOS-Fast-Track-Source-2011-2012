//
//  MyView.m
//  ResponderTest
//
//  Created by Nicholas Outram on 11/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    NSLog(@"TOP LEVEL VIEW received touch event from %@", NSStringFromClass([[touch view] class]) );
    
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
