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
@synthesize mpc, result;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //Initialise data (NOT THE VIEW)
        self.result = [NSString stringWithString:@"?"];
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"ViewDidLoad called on %@", [self class]);
    
    // Custom initialization    
    self.instructionLabel.text = [NSString stringWithFormat:@"This guy weighs %@", self.result];     
       
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
    NSLog(@"viewDidUnload called on %@", [self class]);
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    //You only get here if the view for this controller can / has been released
    //For this to save memory, you also need to release the subviews
    //All the below are retained subviews of the main view 
    
    //Container view and its subviews
    self.containerView = nil;
    self.instructionLabel = nil;
    self.mugShot = nil;
    
    //Toolbar and subviews
    self.toolBar = nil;
    self.btnAbout = nil;
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
    
    //Update model
    if (mpc.selectedItem) {
        self.result = mpc.selectedItem;
        NSString *message = [NSString stringWithFormat:@"This guy weighs %@", self.result]; 

        //Update view (if it is nil, nothing happens)
        self.instructionLabel.text = message;         
    }
    
    //Remove the modal view
    [self dismissModalViewControllerAnimated:YES];
    self.mpc = nil;
   
}

@end
