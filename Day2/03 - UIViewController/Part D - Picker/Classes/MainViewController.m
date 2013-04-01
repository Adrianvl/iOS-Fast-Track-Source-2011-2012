//
//  MainViewController.m
//  Nibbly
//
//  Created by noutram on 08/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController
@synthesize containerView;
@synthesize toolBar, btnAbout , instructionLabel, mugShot;
@synthesize mpc;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        CGRect r = self.view.frame;
        r.origin.y = 20;
        self.view.frame = r;
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
       
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning called on %@", [self class]);
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

    
}


- (void)dealloc {
    [super dealloc];
}


-(IBAction) buttonAboutTouchedDown:(id)sender
{
    mpc = [[ModalPopupController alloc] initWithNibName:@"ModalPopupController" bundle:nil delegate:self];
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:mpc animated:YES];
}

#pragma mark <ModalPopupControllerDelegate>
-(void)ModalPopupControllerDone
{
    NSLog(@"Got message from ModalPopupController that it wants to dissapear");
	if (mpc.selectedItem != nil) {
		self.instructionLabel.text = [@"This guy weighs " stringByAppendingString:mpc.selectedItem];
	}
    [self dismissModalViewControllerAnimated:YES];
    self.mpc = nil;
}

@end
