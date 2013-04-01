//
//  CustomViewAppDelegate.m
//  CustomView
//
//  Created by noutram on 05/02/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import "CustomViewAppDelegate.h"

@implementation CustomViewAppDelegate

@synthesize window, boxView, timer, scrollView;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
    
    //First - the scroll view
    scrollView = [[UIScrollView alloc] initWithFrame:[window bounds]];
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
    [scrollView setContentOffset:offset];
    // contentOffset:
    // "The point at which the origin of the content view is offset from the origin of the scroll view."
    
    //To support zooming
    [scrollView setMinimumZoomScale:0.5];
    [scrollView setMaximumZoomScale:4.0];
    [scrollView setDelegate:self];
    
    
    //Create subview with the same oversized view
    boxView = [[Boxes alloc] initWithFrame:largeRect];
	[boxView setBackgroundColor:[UIColor clearColor]];
    
    //Make this view a subview of the scroll view
    [scrollView addSubview:boxView];
    
    //Tidy up
    [boxView release];
    //[scrollView release];
    
    //Timer
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerDidFire:) userInfo:nil repeats:YES];
    [timer fire];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}
             
- (void)timerDidFire:(NSTimer*)theTimer
{
    NSLog(@"Timer fired");
    CGRect newRect;
    
    //The blue rect is 350x150
    
    //Scroll the screen
    newRect.origin.x = rand() % 320;
    newRect.origin.y = rand() % 480;
    newRect.size.width = [window bounds].size.width;
    newRect.size.height = [window bounds].size.height;
//    newRect.size.
	
	//Programmatically scroll
    [scrollView scrollRectToVisible:newRect animated:YES];
    
}

#pragma mark <UIScrollViewDelegate>
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return boxView;
}

@end
