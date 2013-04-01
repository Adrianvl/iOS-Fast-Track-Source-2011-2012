//
//  MainViewController.m
//  EmbeddedWebBrowser
//
//  Created by Nicholas Outram on 22/06/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController
@synthesize backButton;
@synthesize cancelButton;

@synthesize urlTextField;
@synthesize activityInd;
@synthesize toolBarInNib;
@synthesize webView, currentAddress;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.currentAddress = @"http://www.google.com";
    }
    return self;
}

- (void)dealloc
{
    self.webView.delegate = nil;
    [webView release];
    [urlTextField release];
    [activityInd release];
    [toolBarInNib release];

    [cancelButton release];
    [backButton release];
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
    self.webView.delegate = self;
    NSURL *url = [NSURL URLWithString:self.currentAddress];
    NSURLRequest *req = [NSURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageAllowed timeoutInterval:20];
    [self.webView loadRequest:req];
    [self.activityInd startAnimating]; 
    
    //Update back button status
    self.backButton.enabled = self.webView.canGoBack;
    
}

- (void)viewDidUnload
{
    self.webView.delegate = nil;
    [self setWebView:nil];
    [self setUrlTextField:nil];
    [self setActivityInd:nil];
    [self setToolBarInNib:nil];
    [self setCancelButton:nil];
    [self setBackButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITextFieldDeletage protocol
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.urlTextField resignFirstResponder];
    self.currentAddress = self.urlTextField.text;
    
    NSURL *url = [NSURL URLWithString:self.currentAddress];
//    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLRequest *req = [NSURLRequest requestWithURL:url cachePolicy:NSURLCacheStorageAllowed timeoutInterval:20];
    [self.webView loadRequest:req];
    
    return YES;
}

#pragma mark - UIWebViewDelegate protocol
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"%@", NSStringFromSelector(_cmd));    
    [self.activityInd startAnimating];

    //Update back button status
    self.backButton.enabled = self.webView.canGoBack;
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%@", NSStringFromSelector(_cmd));    
    [self.activityInd stopAnimating];
    
    //Update back button status
    self.backButton.enabled = self.webView.canGoBack;
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", NSStringFromSelector(_cmd));    
    [self.activityInd stopAnimating];
    
    //Update back button status
    self.backButton.enabled = self.webView.canGoBack;

}
- (IBAction)cancelButtonTouched:(id)sender {
    [self.webView stopLoading];
    
    //Update back button status
    self.backButton.enabled = self.webView.canGoBack;

}

- (IBAction)backButtonTouched:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView goBack];            
    }
}

- (IBAction)refreshButtonPTouched:(id)sender {
    [self.webView reload];
}
@end
