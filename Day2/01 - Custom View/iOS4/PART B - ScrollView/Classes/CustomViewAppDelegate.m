//
//  CustomViewAppDelegate.m
//  CustomView
//
//  Created by noutram on 05/02/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import "CustomViewAppDelegate.h"

@implementation CustomViewAppDelegate

@synthesize window, boxView;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
    
    //First - the scroll view
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[window bounds]];
    [window addSubview:scrollView];
    
    //Give the scroll view an oversized view
    CGRect largeRect;
    largeRect.origin = CGPointZero;
    largeRect.size.width  = [window bounds].size.width * 2.0;
    largeRect.size.height = [window bounds].size.height * 2.0;
    [scrollView setContentSize:largeRect.size];
    
    //Position the content in center of the scroll view
    CGPoint offset;
    offset.x = largeRect.size.width  * 0.25;
    offset.y = largeRect.size.height * 0.25;
    [scrollView setContentOffset:offset];       //Try commenting out this line
    // contentOffset:
    // "The point at which the origin of the content view is offset from the origin of the scroll view."
    
    //Create subview with the same oversized view
    boxView = [[Boxes alloc] initWithFrame:largeRect];
	[boxView setBackgroundColor:[UIColor clearColor]];
    
    //Make this view a subview of the scroll view
    [scrollView addSubview:boxView];
    
    //Tidy up
    [boxView release];
    [scrollView release];
    
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
