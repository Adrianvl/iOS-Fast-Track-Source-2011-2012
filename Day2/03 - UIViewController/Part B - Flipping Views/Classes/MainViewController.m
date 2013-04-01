//
//  MainViewController.m
//  Nibbly
//
//  Created by noutram on 08/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController {
    UIToolbar *toolBar;
    UIBarButtonItem *btn1;
    UIBarButtonItem *btn2;   
    ViewController1 *vc1;
    ViewController2 *vc2;
    UIViewController *currentSubviewController;    
}

@synthesize toolBar, btn1, btn2;
@synthesize vc1, vc2;
@synthesize currentSubviewController;

#pragma mark View Controller Lifecycle Management
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.vc1 = nil;
		self.vc2 = nil;		
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"viewDidLoad called on %@", [self class]);
    [super viewDidLoad];

    //re-build the interface (in the event of a previous low memory condition)
    [self.view insertSubview:self.currentSubviewController.view atIndex:0];
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
    NSLog(@"%@ received message didReceiveMemoryWarning", [self class]);
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	NSLog(@"viewDidUnload called on %@", [self class]);

    //If we have added some subviews since the nib was loaded, remove them
    [self.currentSubviewController.view removeFromSuperview];
    
    // Release any retained outlets (these get reset in viewDidLoad)
	self.toolBar = nil;
	self.btn1    = nil;
	self.btn2	 = nil;
}


- (void)dealloc {
    self.vc1 = nil;
    self.vc2 = nil;
	self.toolBar = nil;
	self.btn1    = nil;
	self.btn2	 = nil;	
    [super dealloc];
}
#pragma mark -
#pragma mark accessors (getters)

-(ViewController1*)vc1
{
	//Lazily create view controller 1
    if (vc1 == nil) {
        vc1 = [[ViewController1 alloc] initWithNibName:@"ViewController1" bundle:nil];        
    }
	return vc1;
}

-(ViewController2*)vc2
{
	//Lazily create view controller 2
    if (vc2 == nil) {
        vc2 = [[ViewController2 alloc] initWithNibName:@"ViewController2" bundle:nil];        
    }
	return vc2;
}


#pragma mark -
#pragma mark Actions

-(IBAction)button1Touched:(id)sender
{
    NSLog(@"Button 1 touched");
	
	//First remove all subviews from the main view controller
    [self removeAllSubviews];
    
	//Disable buttons during animation
    [self setAllButtonsToState:NO];   
	
	//Animation block - using some of the convenient animation facilities build into UIView
	//Note the use of delegation and @selector
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft 
                           forView:self.view 
                             cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];

    //Here is the change that is animated - you MUST use the getter for this to work
    [self.view insertSubview:self.vc1.view atIndex:0];	//Insert behind the toolbar
    self.currentSubviewController = vc1;
    
	//Now commit the animation
	[UIView commitAnimations];
    
}
-(IBAction)button2Touched:(id)sender
{
    NSLog(@"Button 2 touched");
    [self removeAllSubviews];
        
    [self setAllButtonsToState:NO]; 
    [UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight 
                           forView:self.view 
                             cache:YES];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];    
    [self.view insertSubview:self.vc2.view atIndex:0];
    self.currentSubviewController = vc2;

    [UIView commitAnimations];
}

#pragma mark -

//Set the state of all buttons
-(void)setAllButtonsToState:(BOOL)s
{
    self.btn1.enabled = s;
    self.btn2.enabled = s;
}

//Remove all subviews (except the toolbar) from main view
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
    self.currentSubviewController = nil;
    
}

#pragma mark <animationDelegate method of UIView>

//Call back when animation has finished
-(void)animationDidStop:(NSString *)animationID 
               finished:(NSNumber *)finished 
                context:(void *)context
{
    [self setAllButtonsToState:YES]; 
}





@end
