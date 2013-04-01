//
//  ViewController.m
//  DeepCopy
//
//  Created by Nicholas Outram on 15/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize model = _model;

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
    
    
    Model *m1 = self.model;
    Model *m2 = [m1 copy];      //I think I am taking an independent copy here
    
    //At this point, m1 and m2 are different pointers

    //UPDATE m1
    [m1.arrayOfChildrenNames addObject:@"Jimmy Jnr"];   //Jim has one child

    //UPDATE m2
    [m2 setFirstName:@"Fred"];
    [m2.arrayOfChildrenNames addObject:@"Freddy Jnr"];  //Fred has one child
    
    //Let's do a test on Fred and Jim
    NSLog(@"Model 1: %@", m1);
    NSLog(@"Model 2: %@", m2);   
    
    //Oh my, according to these records, both Fred and Jimmy have children they never knew they had!
    //What's more weird, they're exactly the same children
    //Although this makes Xmas more exciting for the kids, overall this is a bad thing
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

-(Model*)model
{
    if (_model == nil) {
        _model = [[Model alloc] init];
    }
    
    return _model;
}
@end
