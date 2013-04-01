//
//  ViewController.m
//  CustomView
//
//  Created by Nicholas Outram on 06/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //First - the scroll view
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];
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
    Boxes *boxView = [[Boxes alloc] initWithFrame:largeRect];
	[boxView setBackgroundColor:[UIColor clearColor]];
    
    //Make this view a subview of the scroll view
    [scrollView addSubview:boxView];
    
    //Tidy up
    [boxView release];
    [scrollView release];

}
 

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
