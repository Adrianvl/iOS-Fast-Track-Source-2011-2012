//
//  ModalPopupController.m
//  Nibbly
//
//  Created by noutram on 09/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "ModalPopupController.h"


@implementation ModalPopupController
@synthesize delegate, items, selectedItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil delegate:nil];
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil 
             delegate:(id<ModalPopupControllerDelagate>)d 
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        
        //Note the use of the accessor here!
        self.items = [NSArray arrayWithObjects:
                 @"<50Kg, "@"50Kg", @"55Kg", @"60Kg", @"65Kg", @"70Kg", @"75Kg", 
                 @"80Kg", @"85Kg", @"90Kg", @"95Kg", @"100Kg",@">100Kg", nil];
        
        self.delegate = d;
    }
    return self;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    self.delegate = nil;
    self.items = nil;
    self.selectedItem = nil;
    [super dealloc];
}

#pragma mark UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}
#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [items objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectedItem = [items objectAtIndex:row];
    NSLog(@"You picked row %d = %@", row, self.selectedItem);
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [items count];
}

#pragma mark actions
-(IBAction)didTouchDownButton
{
    NSLog(@"Done clicked");
    //tell parent we're done
    if ([self.delegate respondsToSelector:@selector(ModalPopupControllerDone)]) {
        [self.delegate ModalPopupControllerDone];
    }
}
@end
