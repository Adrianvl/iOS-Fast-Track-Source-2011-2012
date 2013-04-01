//
//  ViewController.m
//  ASynchMethods
//
//  Created by Nicholas Outram on 07/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    NSString*(^callBack)(void);
}
@synthesize activityIndicator;
@synthesize labelOutput;
@synthesize startButton;
@synthesize timer;
@synthesize callBack;

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
}

- (void)viewDidUnload
{
    [self setLabelOutput:nil];
    [self setStartButton:nil];
    [self setActivityIndicator:nil];
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
    [labelOutput release];
    [startButton release];
    [activityIndicator release];
    [callBack release];
    [super dealloc];
}

#pragma mark - Actions
- (IBAction)doButtonTouched:(id)sender {
    
    //Static used to log the number of times this is called
    //(This code is not intended to be re-entrant anyway)
    static int numberOfInvokations = 0;
    
    //Update UI
    self.startButton.enabled = NO;
    self.labelOutput.text = @"Button pressed...";
    [self.activityIndicator startAnimating];
    
    //Get the class name of the object that triggered this action
    NSString *source = NSStringFromClass([sender class]);   //This is autoreleased
    
    //This block will go out of scope unless it is copied to the heap
    //Also, the string it refers to will also be autoreleased by the time this
    //block is called. 
    NSString*(^block1)(void) = ^{
        NSString *res = [NSString stringWithFormat:@"%@ touched %d times", source, ++numberOfInvokations];
        return res;
    };

    //NOTE the use of the accessor
    NSLog(@"RC for source is %d", [source retainCount]);    
    self.callBack = block1;    
    NSLog(@"RC for source is %d", [source retainCount]);
    
    //Start the timer
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:NO];
    
}

#pragma mark - Timer Event Handler
- (void)timerFireMethod:(NSTimer*)theTimer
{
    //This is called (on the main thread) by the timer
    NSLog(@"One-Shot Timer Fired");
        
    //Call back block
    NSString *whoSentIt = callBack();

    //Update UI
    self.startButton.enabled = YES;
    [self.activityIndicator stopAnimating];
    self.labelOutput.text = whoSentIt;
    
    NSLog(@"Message originated from %@", whoSentIt);    
}

@end
