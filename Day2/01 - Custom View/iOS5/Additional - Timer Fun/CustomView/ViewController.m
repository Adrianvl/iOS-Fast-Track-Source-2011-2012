//
//  ViewController.m
//  CustomView
//
//  Created by Nicholas Outram on 06/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize timer;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
@synthesize boxView, scrollView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //First - the scroll view
    scrollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];
    [self.view addSubview:scrollView];
    
    //Give the scroll view an oversized view
    CGRect largeRect;
    largeRect.origin = CGPointZero;
    largeRect.size.width  = [self.view bounds].size.width * 2.0;
    largeRect.size.height = [self.view bounds].size.height * 2.0;
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
    
    //To support zooming
    [scrollView setMinimumZoomScale:0.5];
    [scrollView setMaximumZoomScale:4.0];
    [scrollView setDelegate:self];    
    
    //Make this view a subview of the scroll view
    [scrollView addSubview:boxView];
    
    //Tidy up
//    [boxView release];
//    [scrollView release];
    
    //Timer
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerDidFire:) userInfo:nil repeats:YES];
    [timer fire];


}

//Delegate method (part of the UIScrollViewDelegateProtocol>
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.boxView;
}

- (void)timerDidFire:(NSTimer*)theTimer
{
    NSLog(@"Timer fired");
    CGRect newRect;
    
    //The blue rect is 350x150
    
    //Scroll the screen
    newRect.origin.x = rand() % 320;
    newRect.origin.y = rand() % 480;
    newRect.size.width = [self.view bounds].size.width;
    newRect.size.height = [self.view bounds].size.height;

    //For the scroll zoom to a sensiblw value
    self.scrollView.zoomScale = 0.6;

	
	//Programmatically scroll
    [self.scrollView scrollRectToVisible:newRect animated:YES];
    

    
}

- (void)dealloc {
    [boxView release];
    [scrollView release];
    [super dealloc];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    //We have retained this - so to allow the controller to deallocate this (in the event it becomes covered up)
    //release the object by setting to nil via the accessor method
    self.boxView = nil;
    self.scrollView = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
