//
//  ViewController.m
//  NSThreadExample
//
//  Created by Nicholas Outram on 24/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    BOOL _button1State;
    BOOL _button2State;
    BOOL _task1Processing;
    BOOL _task2Processing;    
}
@synthesize label1;
@synthesize label2;
@synthesize stepper1;
@synthesize stepper2;
@synthesize progressBar1;
@synthesize progressBar2;
@synthesize activityIndicator1;
@synthesize button1;
@synthesize button2;

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
    [self setProgressBar1:nil];
    [self setProgressBar2:nil];
    [self setActivityIndicator1:nil];
    [self setButton1:nil];
    [self setButton2:nil];
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setStepper1:nil];
    [self setStepper2:nil];
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

//Show and animate the activity indicator when there is some processing
-(void)updateActivityIndicator
{
    //Activity indicator
    if ((_task1Processing==YES) || (_task2Processing==YES)) {
        [self.activityIndicator1 startAnimating];
    } else {
        [self.activityIndicator1 stopAnimating];        
    }

}

#pragma mark - Actions
- (IBAction)doButton1:(id)sender {
    //Prevent the user from clicking twice (not great, but it'll do for now)
    self.button1.enabled = NO;
    self.progressBar1.progress = 0.0;
    _task1Processing = YES;

    [self updateActivityIndicator];
        
    //Fire off the thread
    [self performSelectorInBackground:@selector(doMassiveTask1:) withObject:[NSNumber numberWithDouble:self.stepper1.value]];
    
    
}
- (IBAction)doButton2:(id)sender {
    //Prevent the user from clicking twice (not great, but it'll do for now)
    self.button2.enabled = NO;
    self.progressBar2.progress = 0.0;
    _task2Processing = YES;

    [self updateActivityIndicator];
    
    //Fire off the thread (using a slightly different API)
    [NSThread detachNewThreadSelector:@selector(doMassiveTask2:) toTarget:self withObject:[NSNumber numberWithDouble:self.stepper2.value]];

}

- (IBAction)doStepper1:(id)sender {
    self.label1.text = [NSString stringWithFormat:@"%2.0f", self.stepper1.value];
}

- (IBAction)doStepper2:(id)sender {
    self.label2.text = [NSString stringWithFormat:@"%2.0f", self.stepper2.value];

}

#pragma mark - Threads
//Each of these can run on a seperate thread - they don't do much, but illustrate the mechanism of NSThread
-(void)doMassiveTask1:(id)obj
{
    @autoreleasepool {
        NSNumber *objIter = (NSNumber*)obj;
        NSUInteger Niter = [objIter intValue];
        for (NSUInteger idx = 0; idx < Niter; idx++) {
            usleep(500000);
            float val = (float)(idx+1)/(float)Niter;
            [self performSelectorOnMainThread:@selector(callBack1:) withObject:[NSNumber numberWithFloat:val] waitUntilDone:YES];
        }
        [self performSelectorOnMainThread:@selector(task1IsDone:) withObject:nil waitUntilDone:YES];
    }
}
-(void)doMassiveTask2:(id)obj
{
    @autoreleasepool {
        NSNumber *objIter = (NSNumber*)obj;
        NSUInteger Niter = [objIter intValue];
        for (NSUInteger idx = 0; idx < Niter; idx++) {
            usleep(500000);
            float val = (float)(idx+1)/(float)Niter;
            [self performSelectorOnMainThread:@selector(callBack2:) withObject:[NSNumber numberWithFloat:val] waitUntilDone:YES];
        }
        [self performSelectorOnMainThread:@selector(task2IsDone:) withObject:nil waitUntilDone:YES];        
    }
}

#pragma mark - callbacks (on main thread)
//Written for simplicity, clarity but not cleverness/elegance (too much duplication of code)
-(void)callBack1:(id)obj
{
    NSNumber *num = (NSNumber*)obj;
    float u = [num floatValue];
    self.progressBar1.progress = u;
}
-(void)task1IsDone:(id)sender
{
    self.button1.enabled = YES;
    _task1Processing = NO;
    [self updateActivityIndicator];
}
   
-(void)callBack2:(id)obj
{
    NSNumber *num = (NSNumber*)obj;
    float u = [num floatValue];
    self.progressBar2.progress = u;
}
-(void)task2IsDone:(id)sender
{
    self.button2.enabled = YES;
    _task2Processing = NO;    
    [self updateActivityIndicator];    
}


@end
