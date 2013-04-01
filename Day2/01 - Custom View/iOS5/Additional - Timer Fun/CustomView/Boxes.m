//
//  Boxes.m
//  CustomView
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "Boxes.h"


@implementation Boxes
@synthesize length, height, xpos, ypos, center, rectAlpha;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.length = 350.0;
        self.height = 150.0;
		rectAlpha = 1.0;
		
        //Size of rectangle available
        CGRect bounds = [self bounds];      //CGRect is a 'Core Graphics' structure
        
        //Locate the center
        center.x = bounds.origin.x + bounds.size.width/2.0;     //Note I am not calling the setter
        center.y = bounds.origin.y + bounds.size.height/2.0; 
		self.xpos = center.x-(self.length/2.0);
		self.ypos = center.y-(self.height/2.0);
        
        //Explicitly turn off multi-touch (this is the default - but now you've seen it, you know how to turn it on!)
		//This is not to be confused with gestures, such as pinch-zoom
		[self setMultipleTouchEnabled:NO];

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
//  [[UIColor blackColor] setStroke];
//	[[UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:self.rectAlpha] setFill];
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, self.rectAlpha);
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, self.rectAlpha);
    
    //Draw and fill rectangle
    CGContextFillRect(context, CGRectMake(self.xpos, self.ypos, self.length, self.height));
    CGContextAddRect(context,  CGRectMake(self.xpos, self.ypos, self.length, self.height));
    
    //Stroke
    CGContextStrokePath(context);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesBegan : number of fingers = %d", [touches count]);
	UITouch *touch = [touches anyObject];
	CGPoint pos;
	pos = [touch locationInView:self];
	self.xpos = pos.x - (self.length/2.0);
	self.ypos = pos.y - (self.height/2.0);
	self.rectAlpha = 0.5;
	[self setNeedsDisplay];	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesMoved");
	UITouch *touch = [touches anyObject];	//There is only one in the set
	CGPoint pos;	
	pos = [touch locationInView:self];
	self.xpos = pos.x - (self.length/2.0);
	self.ypos = pos.y - (self.height/2.0);
	self.rectAlpha = 0.5;
	[self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesEnded");
	self.rectAlpha = 1.0;
	[self setNeedsDisplay];	
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"touchesCancelled");
	self.rectAlpha = 1.0;
	[self setNeedsDisplay];		
}

- (void)dealloc {
    [super dealloc];
}


@end
