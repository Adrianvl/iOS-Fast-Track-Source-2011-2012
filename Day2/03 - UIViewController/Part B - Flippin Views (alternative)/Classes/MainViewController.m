//
//  MainViewController.m
//  Nibbly
//
//  Created by noutram on 08/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController {
    UIView *containerView;
    UIToolbar *toolBar;
    UIBarButtonItem *btn1;
    UIBarButtonItem *btn2;
    UIBarButtonItem *btnClear;    
    UILabel *instructionLabel;
    ViewController1 *vc1;
    ViewController2 *vc2;    
}


@synthesize containerView;
@synthesize toolBar, btn1, btn2,btnClear, instructionLabel;
@synthesize vc1, vc2;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//    return YES;
}


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
    self.btn1 = nil;
    self.btn2 = nil;
    self.btnClear = nil;
    self.instructionLabel = nil;
}


- (void)dealloc {
    self.vc1 = nil;
    self.vc2 = nil;
    self.containerView = nil;
    self.toolBar = nil;
    self.btn1 = nil;
    self.btn2 = nil;
    self.btnClear = nil;
    self.instructionLabel = nil;

    [super dealloc];
}

//Custom accessors
-(ViewController1*)vc1
{
    if (vc1 == nil) {
        vc1 = [[ViewController1 alloc] initWithNibName:@"ViewController1" bundle:nil];        
    }
    return vc1;
}
-(ViewController2*)vc2
{
    if (vc2 == nil) {
        vc2 = [[ViewController2 alloc] initWithNibName:@"ViewController2" bundle:nil];        
    }
    return vc2;
}

//Actions
-(IBAction)button1Touched:(id)sender
{
    NSLog(@"Button 1");
    [self removeAllSubviews];

    [self setAllButtonsToState:NO];     
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft 
                           forView:self.containerView 
                             cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    
    [self.containerView addSubview:self.vc1.view];
    [UIView commitAnimations];
    
}
-(IBAction)button2Touched:(id)sender
{
    NSLog(@"Button 2");
    [self removeAllSubviews];
    
    [self setAllButtonsToState:NO]; 
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight 
                           forView:self.containerView 
                             cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)]; 
    
    [self.containerView addSubview:self.vc2.view];
    [UIView commitAnimations];
}

-(void)setAllButtonsToState:(BOOL)s
{
    self.btn1.enabled = s;
    self.btn2.enabled = s;
    self.btnClear.enabled = s;
}
-(void)animationDidStop:(NSString *)animationID 
               finished:(NSNumber *)finished 
                context:(void *)context
{
    [self setAllButtonsToState:YES]; 
}

-(void)removeAllSubviews
{
    if (vc1 != nil) {
        [vc1.view removeFromSuperview];
        self.vc1 = nil;
    }
    if (vc2 != nil) {
        [vc2.view removeFromSuperview];
        self.vc2 = nil;
    }
    
}
-(IBAction)buttonClearTouched:(id)sender
{
    [self removeAllSubviews];
}

@end
