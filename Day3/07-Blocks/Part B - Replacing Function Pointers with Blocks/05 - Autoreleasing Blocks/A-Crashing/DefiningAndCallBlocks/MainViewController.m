//
//  MainViewController.m
//  DefiningAndCallBlocks
//
//  Created by Nicholas Outram on 28/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

@synthesize numberPicker = _numberPicker;
@synthesize window=_window;
@synthesize resultLabel = _resultLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)dealloc
{
    self.numberPicker = nil;
    self.resultLabel = nil;
    self.window = nil;
    [super dealloc];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d", row+1];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%d selected", row+1);
}


#pragma mark UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return MYMAXFACTORIAL;
}


#pragma mark Actions
//Actions - there is only one, and the buttons are 'tagged'
- (IBAction)doButton:(id)sender 
{
    //Which button was selected? We can use the tag property (set in IB) to differentiate
    NSUInteger tag = [sender tag];
    
    //What value was selected?
    int u =  [self.numberPicker selectedRowInComponent:0]+1;
    
    //Delare and define blocks for each math function
    // Remember!
    // Blocks are objects
    // Blocks are (by default) on the stack unless copied
    typedef NSString*(^mathBlock)();
    
    mathBlock calcSqrtAsString = ^ {
        return [NSString stringWithFormat:@"%3.6f", sqrt((double)u)];
    };
    mathBlock calcTwoPowerAsString = ^ {
        return [NSString stringWithFormat:@"%d", 1<<u];
    };
    mathBlock calcFactorialAsString = ^ {
        long long res=1L;
        for (int k=u; k>1; k--) {
            res *= k;
        }
        NSString *strRes = [NSString stringWithFormat:@"%lld", res];
        return strRes;
    };
        
    //Dynamically get the block of code that will perform the right function**
    NSArray *arrayOfBlocks = [NSArray arrayWithObjects:calcFactorialAsString, calcSqrtAsString, calcTwoPowerAsString, nil];
    mathBlock selectedBlock = [arrayOfBlocks objectAtIndex:tag];
    
    //Update the UI by calling the block
    NSString *res = selectedBlock();
    self.resultLabel.text = res;
        
    // **NOTES - This code crashes - your job it to understand why
    // Hint - blocks are stored on the local stack
        
}

@end