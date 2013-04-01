//
//  MainViewController.m
//  PlainTable
//
//  Created by Nicholas Outram on 30/03/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"
#import "Model.h"

@implementation MainViewController
@synthesize tableView, model,editingMode;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		model = [[Model alloc] init];
        self.title = @"Strange Pets";
        self.editingMode = UITableViewCellEditingStyleDelete;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    //Override the back button for this view controller
    UIBarButtonItem *backButton = [[[UIBarButtonItem alloc] init] autorelease];
    backButton.title = @"Back";
    self.navigationItem.backBarButtonItem = backButton;
    
    //Also - I could set the tool bar items here
    
    //This one is for free with UIViewController - see the class reference for details
    //This built in button will (by default) will message this controller with the selector setEditing:animated:
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(doAdd:)] autorelease]; 
    
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {    
	self.model = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [[self.model categoriesOfPets] count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	NSString *Key = [self.model.categoriesOfPets objectAtIndex:section];		//Get the section string (also the key)
	NSArray *arrayOfPets = [self.model.dictionaryOfSections objectForKey:Key];	//Get the object (NSArray) for this Key
	
    return [arrayOfPets count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	// I'm going to use the most basic (default)
	NSString *Key = [self.model.categoriesOfPets objectAtIndex:indexPath.section];		//Get the section string (also the key)
	NSArray *arrayOfPets = [self.model.dictionaryOfSections objectForKey:Key];	//Get the object (NSArray) for this Key
	
	cell.textLabel.text       = [arrayOfPets objectAtIndex:indexPath.row];
    cell.accessoryType        = UITableViewCellAccessoryDisclosureIndicator;
    cell.editingAccessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

//Section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSString *Key = [self.model.categoriesOfPets objectAtIndex:section];		//Get the section string (also the key)
	return Key;
}

//Deletion support 
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//Commit add or delete
- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"Delete");
        NSString *Key = [self.model.categoriesOfPets objectAtIndex:indexPath.section];		//Get the section string (also the key)
        NSMutableArray *arrayOfPets = [self.model.dictionaryOfSections objectForKey:Key];	//Get the object (NSMutableArray) for this Key
        [arrayOfPets removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationBottom];        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"Insert");
    }       

}

// This is called whenever the table editing mode (state) is changed (via the plus or edit button).
// The table has two states, editing=YES, editing=NO
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];    //This is needed for the edit button to change back to done
    
    //If returning to the non-editing state
    if (editing == NO) {
        self.editingMode = UITableViewCellEditingStyleDelete;
    }
    
    //Change the tableview state
    self.tableView.editing = editing;
}

//For row re-ordering
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *fromKey = [self.model.categoriesOfPets objectAtIndex:fromIndexPath.section];		//Get the section string (also the key)
    NSMutableArray *fromArrayOfPets = [self.model.dictionaryOfSections objectForKey:fromKey];	//Get the object (NSMutableArray) for this Key
    
    NSString *toKey = [self.model.categoriesOfPets objectAtIndex:toIndexPath.section];		//Get the section string (also the key)
    NSMutableArray *toArrayOfPets = [self.model.dictionaryOfSections objectForKey:toKey];	//Get the object (NSMutableArray) for this Key
    
    NSString *fromString = [[fromArrayOfPets objectAtIndex:fromIndexPath.row] copy]; //NOTE THE COPY (semantics really, probably does a retain under the hood as this is imutable)

    //Update model
    int to   = toIndexPath.row;
    int from = fromIndexPath.row;
    
    NSLog(@"toArray=%@", toArrayOfPets);
    NSLog(@"fromArray=%@", fromArrayOfPets);
    
    //Move the data to align with the view change
    [fromArrayOfPets removeObjectAtIndex:from];
    [toArrayOfPets   insertObject:fromString atIndex:to];

    //Handy to check everything is good
    NSLog(@"toArray=%@", toArrayOfPets);
    NSLog(@"fromArray=%@", fromArrayOfPets);
    
    //Balance the copy
    [fromString release];

}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	[tv deselectRowAtIndexPath:indexPath animated:YES];
	NSString *Key = [self.model.categoriesOfPets objectAtIndex:indexPath.section];              //Get the section string (also the key)
	NSArray *arrayOfPets = [self.model.dictionaryOfSections objectForKey:Key];                  //Get the object (NSArray) for this Key
	NSLog(@"You selected %@ from section %@", [arrayOfPets objectAtIndex:indexPath.row], Key);
    
    //Now push an adding/editing page
    //TBD
    
}

//WE COULD ALSO DO ADDING DATA
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.editingMode;        
}

//Accessors button touched
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Accessory touched - this is going to edit");
}

//- (void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}

#pragma mark - Actions
-(void)doAdd:(id)sender
{
    NSLog(@"Add");
    self.editingMode = UITableViewCellEditingStyleInsert;
    [self setEditing:YES animated:YES];
}

@end
