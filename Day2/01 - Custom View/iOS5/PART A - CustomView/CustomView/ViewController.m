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
    
    //Instantiate and initialise a boxView
    Boxes *boxView = [[Boxes alloc] initWithFrame:[self.view bounds]];
	[boxView setBackgroundColor:[UIColor clearColor]];	//Transparent view
    
    //Create a view heirarchy - the parent view is responsible for retaining any subviews
    [self.view addSubview:boxView];
    
    //Save to release the object (parent view is retaining it as it is also an owner)
    [boxView release];
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
