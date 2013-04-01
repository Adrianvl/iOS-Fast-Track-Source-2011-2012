//
//  MainViewController.m
//  Resize
//
//  Created by noutram on 07/06/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController
@synthesize catImage;
@synthesize tableImage;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];	
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
	
	//Cat image:
	// P: (x,y)=(100,95)	;	(w,h)=(121,128)
	// L: (x,y)=(20,95)     ;   (w,h)=(121,128)

	//Table image:
	// P: (x,y)=(99,231)		;	(w,h)=(121,128)
	// L: (x,y)=(right-20,85)	;   (w,h)=(121,128)
	
	
	CGRect tigerRect = [self.catImage frame];
	CGRect tableRect = [self.tableImage frame];
	CGRect containerBounds = [self.view bounds];
				
	if (interfaceOrientation == UIInterfaceOrientationPortrait) {
		//Portrait
		tigerRect.origin.x = 100;
		
		tableRect.origin.x = 99;
		tableRect.origin.y = 231;
	} else {
		//Landscape
		tigerRect.origin.x = 20;

		tableRect.origin.x = containerBounds.size.width-20-tableRect.size.width;
		tableRect.origin.y = 95;

	
	}
	self.catImage.frame = tigerRect;
	self.tableImage.frame = tableRect;
}

- (void)dealloc {
    [super dealloc];
}


@end
