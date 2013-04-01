//
//  ATViewController.m
//  AutoTableTest
//
//  Created by Nicholas Outram on 18/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ATViewController.h"
#import "CustomCell.h"

@implementation ATViewController
@synthesize tableView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Register UITableViewCell type objects
    UINib *myNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableView registerNib:myNib forCellReuseIdentifier:@"myCustomCell"];

    //Second cell type
    UINib *myNib2 = [UINib nibWithNibName:@"CustomCell2" bundle:nil];
    [self.tableView registerNib:myNib2 forCellReuseIdentifier:@"myCustomCell2"];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
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

#pragma mark - UITableViewDelegate and DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 8;
}


#warning "You should modify the following line to be either 1 or 2"
#define METHOD 1

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    NSUInteger idx = (((NSUInteger)indexPath.section >> 1) & 1);

#if (METHOD == 1)
    //METHOD-1 Change Cell Property    
    CustomCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"myCustomCell"];
    if (idx == 1) {
        cell.left_imageView.image = [UIImage imageNamed:@"folderx.png"];
    } else {
        cell.left_imageView.image = [UIImage imageNamed:@"folder.png"];
    }
#endif
    
#if (METHOD == 2)
    //METHOD-2 use different cell type (Faster version)
    CustomCell *cell;
    if (idx == 1) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"myCustomCell2"];        
    } else {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"myCustomCell"];
    }
#endif
    
    
    cell.boldLabel.text = [NSString stringWithFormat:@"Section %d, Row %d",indexPath.section, indexPath.row];    
    return cell;
    
}
- (IBAction)onOffFromCellTouched:(id)sender {
//    UISegmentedControl *sc = (UISegmentedControl*)sender;
//    NSLog(@"Object %@ changed value to %d", NSStringFromClass([sender class]), sc.selectedSegmentIndex);
    
}
@end
