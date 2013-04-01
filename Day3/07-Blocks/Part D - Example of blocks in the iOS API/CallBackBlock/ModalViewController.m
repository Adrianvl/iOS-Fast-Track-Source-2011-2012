//
//  ModalViewController.m
//  SingletonModel
//
//  Created by Nicholas Outram on 13/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "ModalViewController.h"

@implementation ModalViewController
@synthesize textInputBox;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    [NSException raise:@"ModalViewControllerException" format:@"Cannot use this initialiser"];
    return nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil callBack:(ModalViewControllerCallBackBlock)cb
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        dismissBlock = [cb copy];   //This is needed as the context of the block will go out of scope before it is used
    }
    return self;
}

- (IBAction)saveButtonTouched:(id)sender {
    dismissBlock(self.textInputBox.text, YES);
}

- (IBAction)cancelButtonTouched:(id)sender {
    dismissBlock(@"CANCEL", NO);
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
    [self setTextInputBox:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {

    [dismissBlock release];     //Avoid a leak!
    [textInputBox release];
    [super dealloc];
}

#pragma mark UITextFieldDelgate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
