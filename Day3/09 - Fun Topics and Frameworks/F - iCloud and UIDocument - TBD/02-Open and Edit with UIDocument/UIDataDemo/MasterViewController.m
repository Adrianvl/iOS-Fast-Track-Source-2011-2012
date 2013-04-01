//
//  MasterViewController.m
//  UIDataDemo
//
//  Created by Nicholas Outram on 10/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

//Private API using an anonymous category
@interface MasterViewController ()
-(void)updateFileList:(NSString*)newDocumentName;
@end


@implementation MasterViewController {
 
}

@synthesize fileList;
@synthesize openModel;


#pragma mark - accessors
-(NSMutableArray*) fileList
{
    if (fileList == nil) {
        //First try to unarchive
        NSString *path = [NSBundle pathToFileInDocumentsFolder:@"filelist.archive"];
        self.fileList = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        //If run for the first time, then create an empty array
        if (fileList == nil) {
            fileList = [[NSMutableArray alloc] init];
            [NSKeyedArchiver archiveRootObject:fileList toFile:path];
        }
    }
    return fileList;
}

-(void)updateFileList:(NSString*)newDocumentName
{
    [self.fileList addObject:newDocumentName];
    NSString *path = [NSBundle pathToFileInDocumentsFolder:@"filelist.archive"];
    [NSKeyedArchiver archiveRootObject:self.fileList toFile:path];

}

#pragma mark -

- (void)awakeFromNib
{
    [super awakeFromNib];
}

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
    //[self.tableView reloadData];
    NSLog(@"View Did Load, File list: %@", self.fileList);
}

- (void)viewDidUnload
{
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"Here we go");
    
    DetailViewController *dvc = (DetailViewController*)[segue destinationViewController];

    if ([[segue identifier] isEqualToString:@"NewDetail"]) {
    // CREATE NEW RECORD
        dvc.fileid = [NSString stringWithFormat:@"uk_ac_plymouth_%u", [self.fileList count]+1];
        dvc.isNewDocument = YES;
        
        //This is the ADD button call
        void(^callBack)(BOOL);
        callBack = ^(BOOL SAVE) {
            if (SAVE) {
                
                //Update the filelist
                [self updateFileList:dvc.fileid];
                [self.tableView reloadData];
                
            } else {
                NSLog(@"Cancel - do nothing");
            }
        }; 
        
        //Set block callback for ADD
        dvc.dissmissAndSave = callBack;
        
    } else if ([[segue identifier] isEqualToString:@"EditDetail"]) {
    // EDIT EXISTING RECORD       
        NSLog(@"TODO: Edit");
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        dvc.isNewDocument = NO;
        dvc.fileid = [NSString stringWithFormat:@"uk_ac_plymouth_%u", indexPath.row+1];
        
        void(^callBack)(BOOL);
        callBack = ^(BOOL SAVE) {
            if (SAVE) {
                NSLog(@"Document Updated");
            } else {
                NSLog(@"Cancel - do nothing");
            }
        }; 
        dvc.dissmissAndSave = callBack;
    } else {
        NSLog(@"ERROR - did not recognise segue");
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fileList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //You don't need registerNib:forCellReuseIdentifier: when using storyboard
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.nameLabel.text = @"Name needs to be added";    
    cell.filenameLabel.text = [self.fileList objectAtIndex:indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
