//
//  PopViewController.m
//  PopUpDemo
//
//  Created by Nicholas Outram on 14/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController {

    UIPopoverController *poc;   //This is by default a **strong** reference - ARC will do the rest
}

@synthesize popOverButton;
@synthesize poc;

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
                                
}

- (void)viewDidUnload
{
    [self setPopOverButton:nil];
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
    return YES;
}

-(UIPopoverController*)poc
{
    if (poc == nil) {
        //Create an instance of the action view controller 
        ActionViewController *avc = [[ActionViewController alloc] init];
        
        //Create an instance of UIPopoverController - ****this is a view controller container****
        //and pass it a reference to the view controller it is to contain
        poc = [[UIPopoverController alloc] initWithContentViewController:avc];
        poc.delegate = self;
    }
    return poc;
}

- (IBAction)doPopover:(id)sender {
        
    //Second press is to dismiss the popover
    if ([self.poc isPopoverVisible]) {
        [self.poc dismissPopoverAnimated:YES];   
        self.poc = nil;
    }
    else {
        //Make the pop-over controller visible - visually originating from the toolbar button
        [poc presentPopoverFromBarButtonItem:self.popOverButton 
                    permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES
         ];   
    }
    
}

//Delegate methods
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    NSLog(@"Popover dismissed");
    self.poc = nil;
}
@end
