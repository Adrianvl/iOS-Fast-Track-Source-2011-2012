//
//  DetailViewController.m
//  UIDataDemo
//
//  Created by Nicholas Outram on 10/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize nameTextField = _nameTextField;
@synthesize ageTextField = _ageTextField;
@synthesize fidTextField = _fidTextField;
@synthesize model = _model;
//@synthesize name=_name;
//@synthesize age=_age;
@synthesize fileid = _fileid;
@synthesize isNewDocument = _isNewDocument;
@synthesize dissmissAndSave;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

-(ModelClass*)model 
{
    if (_model == nil) {
        NSURL *fileURL = [NSURL fileURLWithPath:[NSBundle pathToFileInDocumentsFolder:self.fileid]];
        _model = [[ModelClass alloc] initWithFileURL:fileURL];                    
    }
    return _model;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}
-(void)didMoveToParentViewController:(UIViewController *)parent
{
    NSLog(@"didMoveToParentViewController");
}

#pragma mark - Document Management

-(void)saveAndOverwriteOrCreate:( void(^)(BOOL) )completionBlock
{    
    self.model.name = self.nameTextField.text;
    self.model.age  = [NSNumber numberWithInteger:[self.ageTextField.text intValue]];

    //Attempt to save
    if (self.isNewDocument) {
        NSLog(@"fileURL = %@", self.model.fileURL);
        [self.model saveToURL:self.model.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:completionBlock];        
    } else {
        [self.model saveToURL:self.model.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:completionBlock];        
    }
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark -actions
- (IBAction)doSave:(id)sender {
    NSLog(@"Save");
    
    //Save and quite block
    void(^saveAndClose)(BOOL) = ^(BOOL didSaveOrCreate) {
        
        //CLOSE DOCUMENT
        [self.model closeWithCompletionHandler:^(BOOL success) {
            
            //Mesasge back
            dissmissAndSave(success);
            
            //Navigate back
            [self.navigationController popViewControllerAnimated:YES];

        }];
    };
    
    //Save data - as if editing
    [self saveAndOverwriteOrCreate:saveAndClose];

}

- (IBAction)doCancel:(id)sender {
    NSLog(@"Cancel");
    void(^closeBlock)(BOOL) = ^(BOOL success) {
        dissmissAndSave(NO);        
    };
    if (self.isNewDocument == NO) {
        [self.model closeWithCompletionHandler:closeBlock];
    } else {
        dissmissAndSave(NO);
    }
    
    [self.navigationController popViewControllerAnimated:YES];    
}

#pragma mark - View lifecycle
- (void)configureView
{
    //This only applies to document editing
    if (self.isNewDocument == YES) return;
    
    //Update the UI
    void(^updateView)(BOOL)=^(BOOL  documentLoaded) {
        if ( documentLoaded == YES ) {
            self.nameTextField.text = self.model.name;
            self.ageTextField.text = [NSString stringWithFormat:@"%@", self.model.age];
            self.fidTextField.text = self.fileid;                    
        }
    };
    
    //Has the document been opened?
    [self.model openWithCompletionHandler:updateView];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
    [self setAgeTextField:nil];
    [self setFidTextField:nil];
    [self setDissmissAndSave:nil];
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


@end
