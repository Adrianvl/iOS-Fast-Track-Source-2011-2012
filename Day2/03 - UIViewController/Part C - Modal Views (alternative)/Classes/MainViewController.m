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
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization

    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
//    CGRect r = self.view.frame;
//    r.origin.y = 20;
//    self.view.frame = r;
    
//    NSLog(@"I am going to force the  nib to load by referencing the view %@", self.view);
       
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
    self.containerView = nil;
    self.toolBar = nil;
    self.btnAbout = nil;
    self.instructionLabel = nil;
    self.mugShot = nil;
}


- (void)dealloc {
    self.containerView = nil;
    self.toolBar = nil;
    self.btnAbout = nil;
    self.instructionLabel = nil;
    self.mugShot = nil;    
    [super dealloc];
}

-(IBAction) buttonAboutTouchedDown:(id)sender
{
    mpc = [[ModalViewController alloc] initWithNibName:@"ModalViewController" bundle:nil delegate:self];
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    //Note this new API - that uses a C-Block as a call-back. 
    //The call back comes after viewDidAppear: gets called
    [self presentViewController:mpc animated:YES 
                     completion:^(void) {
                         NSLog(@"Animation Complete!");
                     }
    ];
    [mpc release];
    
//     [self presentModalViewController:mpc animated:YES];
}

#pragma mark <ModalViewControllerDelegate>
-(void)ModalViewControllerDone
{
    NSLog(@"Got message from ModalViewController that it wants to dissapear");
    
    
    //Note this new API - that uses a C-Block as a call-back. The call back comes after     
    [self dismissViewControllerAnimated:YES 
                             completion:^(void) {
                                 NSLog(@"Animation Complete - controller dismissed");
                             }
     ];
//    [self dismissModalViewControllerAnimated:YES];
}

@end
