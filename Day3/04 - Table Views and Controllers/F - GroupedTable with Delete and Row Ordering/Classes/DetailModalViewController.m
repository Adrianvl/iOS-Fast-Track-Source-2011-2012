//
//  DetailModalViewController.m
//  PlainTable
//
//  Created by Nicholas Outram on 29/06/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "DetailModalViewController.h"


@implementation DetailModalViewController
@synthesize buttonOK;
@synthesize nameString;
@synthesize titleLabel;
@synthesize animalNameTextField;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    [[NSException exceptionWithName:@"DetailModalViewController" reason:@"Invalid initialiser" userInfo:nil] raise];
    return nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil name:(NSString*)nameStr delegate:(id)del forEdit:(BOOL)forEditing
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.nameString = nameStr;
        self.delegate = del;
        
        //Checks
        if (delegate == nil) {
            NSLog(@"Warning: View Controller must have a delegate");
        }
        
        
    }
    return self;
}

- (IBAction)buttonTouched:(id)sender {
}

- (void)dealloc
{
    [titleLabel release];
    [animalNameTextField release];
    [buttonOK release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setAnimalNameTextField:nil];
    [self setButtonOK:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
