//
//  ViewController.m
//  BlocksAsArguments
//
//  Created by Nicholas Outram on 02/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize messageLabel;
@synthesize block1Button;
@synthesize block2Button;
@synthesize resetButton;
@synthesize startTime;
@synthesize tableView;
@synthesize data;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - data model accessor
-(NSMutableArray*)data
{
    if (data == nil) {
        data = [[NSMutableArray alloc] initWithCapacity:10];
        [data addObject:[NSNumber numberWithInt: 1]];
        [data addObject:[NSNumber numberWithInt: 3]];
        [data addObject:[NSNumber numberWithInt:-1]];
        [data addObject:[NSNumber numberWithInt:12]];
        [data addObject:[NSNumber numberWithInt: 4]];
        [data addObject:[NSNumber numberWithInt: 0]];
        [data addObject:[NSNumber numberWithInt:11]];
        [data addObject:[NSNumber numberWithInt:-1]];
        [data addObject:[NSNumber numberWithInt: 6]];
        [data addObject:[NSNumber numberWithInt: 7]];         
    }
    return data;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.startTime = [NSDate date];
}

- (void)viewDidUnload
{
    [self setMessageLabel:nil];
    [self setBlock1Button:nil];
    [self setBlock2Button:nil];
    [self setTableView:nil];
    [self setResetButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [messageLabel release];
    [block1Button release];
    [block2Button release];
    [tableView release];
    [resetButton release];
    self.data = nil;
    [super dealloc];
}

#pragma mark - Update UI
//This method takes a single argument - a block declared as type "NSString*(^)(void)"
-(void)updateLabelWithBlock:( NSString*(^)(void) )stringBlock
{
    NSString *newOutput = stringBlock();
    self.messageLabel.text = [NSString stringWithFormat:@"Message: %@", newOutput];
}

#pragma mark - Actions
- (IBAction)doButtonTouched:(id)sender {
    //This is an action common to all buttons
    UIButton *btn = (UIButton*)sender;
    if (btn == self.resetButton) {
        self.data = nil;
        [self.tableView reloadData];
        return;
    }
    
    //Define and Declare block for sort-by-magnitude
    BOOL(^compareAbs)(int,int) = ^(int a, int b) {
        if (abs(a)>abs(b)) {
            return YES;
        } else {
            return NO;
        }
    };
    
    //Select the appropriate sort block
    if (btn == self.block1Button) {
        //Pass defined block
        [self doSort:compareAbs];               //BREAKPOINT THIS LINE
    } else {
        //Example of Passing a block inline
        [self doSort:^(int a, int b) {          //BREAKPOINT THIS LINE
            BOOL gt = (a>b) ? YES : NO;
            return gt;
        }];
    }
    //Reload table based on new data
    [self.tableView reloadData];

}

#pragma mark - Math functions
//Probably the most inefficient sort, 
//but also one of the simplest
-(void)doSort:( BOOL(^)(int,int) )compareBlock
{
    BOOL done = NO;
    while (done == NO) {
        done = YES;
        for (NSUInteger n=0; n<([self.data count]-1); n++) {
            int p = [[self.data objectAtIndex:n] intValue];
            int q = [[self.data objectAtIndex:n+1] intValue];
            if (compareBlock(p,q)) {
                done = NO;
                [self.data exchangeObjectAtIndex:n withObjectAtIndex:n+1];
            }
        }
    }
}



#pragma msrk - data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tblView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tblCell = [tblView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (tblCell == nil) {
        tblCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"] autorelease];
    }
    tblCell.textLabel.text = [NSString stringWithFormat:@"%@", [self.data objectAtIndex:indexPath.row]];
    return tblCell;
}


@end
