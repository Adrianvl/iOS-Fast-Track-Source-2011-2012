//
//  Boxes.m
//  CustomView
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "Boxes.h"


@implementation Boxes
@synthesize length, height, xpos, ypos, center;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.length = 100.0;
        self.height = 50.0;

        //Size of rectangle available
        CGRect bounds = [self bounds];      //CGRect is a 'Core Graphics' structure
        
        //Locate the center
        center.x = bounds.origin.x + bounds.size.width/2.0;     //Note I am not calling the setter
        center.y = bounds.origin.y + bounds.size.height/2.0;        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    // Custom Drawing code
    
    //Get the graphics context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Set the colours
    CGContextSetLineWidth(context, 4.0);
    [[UIColor blackColor] setStroke];
    [[UIColor blueColor] setFill];
    
    //Draw and fill rectangle
    CGContextFillRect(context, CGRectMake(center.x-(self.length/2.0), center.y-(self.height/2.0), self.length, self.height));
    CGContextAddRect(context,  CGRectMake(center.x-(self.length/2.0), center.y-(self.height/2.0), self.length, self.height));
    
    //Stroke
    CGContextStrokePath(context);
}


- (void)dealloc {
    [super dealloc];
}


@end
