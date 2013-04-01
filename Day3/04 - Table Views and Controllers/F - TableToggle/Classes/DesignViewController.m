//
//  DesignViewController.m
//  MyApp
//
//  Created by noutram on 27/12/2009.
//  Copyright 2009 University of Plymouth. All rights reserved.
//

#import "DesignViewController.h"


@implementation DesignViewController
@synthesize toolBar, ltVC, ttVC, mode;

#pragma mark Init and Dealloc
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"Design";
        self.mode = [NSNumber numberWithInt:0];
    }
    return self;
}

- (void)dealloc {
    self.mode = nil;
    [super dealloc];
}

#pragma mark View Load and Unload
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View Did Load");
    self.toolbarItems = self.toolBar.items;
    
    //Load in view controllers
    ltVC = [[LogicTermTableController alloc] initWithNibName:@"LogicTermTableController" bundle:nil];
    ttVC = [[TruthTableController alloc] initWithNibName:@"TruthTableController" bundle:nil];
    
    //Set up initial view
    [self selectViewForMode];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.toolbarItems = nil;
    self.ttVC = nil;
    self.ltVC = nil;
}

#pragma mark View Toggle Code
-(void)selectViewForMode
{
    //Remove all subviews
    for (UIView *v in self.view.subviews) {
        [v removeFromSuperview];
    }
    
    //Set up the animation
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.75];
    
    switch ([mode intValue]) {
        case 0:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
            break;
        case 1:
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
            break;
        default:
            break;
    }
    
    //Add forground view
    if ([mode intValue]==0) {
        [self.view addSubview:ttVC.view];
    } else {
        [self.view addSubview:ltVC.view];
    }
    
    //Do the animation
    [UIView commitAnimations];       
}

#pragma mark Actions
-(IBAction)doToggle:(id)sender
{
    UISegmentedControl* sc = sender;
    NSLog(@"Toggle with value %d", sc.selectedSegmentIndex);
    self.mode    = [NSNumber numberWithInt:sc.selectedSegmentIndex];
    [self selectViewForMode];
}

@end
