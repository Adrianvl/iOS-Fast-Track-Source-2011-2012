//
//  ViewController.m
//  NSThreadExample
//
//  Created by Nicholas Outram on 24/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController {
    BOOL _button1State;
    BOOL _button2State;
    BOOL _task1Processing;
    BOOL _task2Processing;   
    NSThread* _thread1;
    BOOL _thread1Finished;
    NSString* _runLoopString;
}
@synthesize progressBar1;
@synthesize progressBar2;
@synthesize activityIndicator1;
@synthesize button1;
@synthesize button2;
@synthesize stepper1 = _stepper1;
@synthesize stepper2 = _stepper2;
@synthesize label1 = _label1;
@synthesize callBackBlock;

@synthesize thread1 = _thread1;
@synthesize label2 = _label2;
@synthesize thread1Finished = _thread1Finished;

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
    [self setStepper1:nil];
    [self setLabel1:nil];
    [self setLabel2:nil];
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

    //If the thread was never run
    if (_thread1 == nil) {
        callBackBlock(YES);
        return;
    }    
    
    //Flag running method and runloop to exit early
    self.thread1Finished = YES;     
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

#pragma mark - Actions
- (IBAction)doStepper1:(id)sender {
    self.label1.text = [NSString stringWithFormat:@"%1.0f", self.stepper1.value];
}

- (IBAction)doStepper2:(id)sender {
    self.label2.text = [NSString stringWithFormat:@"%1.0f", self.stepper2.value];
}

//Event handler for button 1 - (processed by main run loop)
- (IBAction)doButton1:(id)sender {
    
    //Get the loop iteration from the GUI
    NSNumber *iter = [NSNumber numberWithDouble:[self.stepper1 value]]; 
    
    //Queue up a job for the thread and thus create an input source for its runloop BEFORE its respective thread starts
    [self performSelector:@selector(doMassiveTask1:) onThread:self.thread1 withObject:iter waitUntilDone:NO];
    
    //if not already running, start the thread
    if (self.thread1.isExecuting == NO) {    
        NSLog(@"Starting thread");
        [self.thread1 start];
    }
}

- (IBAction)doButton2:(id)sender {
    
    //Prevent the user from clicking twice (not great, but it'll do for now)
    self.button2.enabled = NO;
    self.progressBar2.progress = 0.0;
    _task2Processing = YES;

    [self updateActivityIndicator];
    
    //Fire off the thread (using a slightly different API)
    [NSThread detachNewThreadSelector:@selector(doMassiveTask2:) toTarget:self withObject:nil];    
}

#pragma mark - Threads

//Create a new thread lazily
-(NSThread*)thread1
{
    if (_thread1 == nil) {
        self.thread1Finished = NO; 
        _thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(setupRunLoop1:) object:_runLoopString];
    }
    return _thread1;
}

//Each of these are run on a seperate thread - they don't do much, but illustrate the mechanism of NSThread and RunLoops
-(void)setupRunLoop1:(id)obj
{
    @autoreleasepool {
        
        //The run loop will check this with every timeout
        self.thread1Finished = NO;        
        
        //Get the run-loop for this thread - this should *already* have a pending "performSelector:" input source
        NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
        
        //Main loop for this thread
        do {
            //Notify main thread the run loop is alive
            [self performSelectorOnMainThread:@selector(logOnMainThread:) withObject:@"Run Loop Calling Main Thread" waitUntilDone:NO];
            
            //Perform all queued selectors
            //Sleep once there are no events to process
            //- timeout after 5 seconds inactivity
            [myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:5]];  
            
        } while (self.thread1Finished == NO);
                
        //Call back to the main thread
        [self performSelectorOnMainThread:@selector(callBackWhenRunLoopIsDone:) withObject:nil waitUntilDone:NO];
        [self performSelectorOnMainThread:@selector(logOnMainThread:) withObject:@"RunLoop Exiting" waitUntilDone:NO];
    }
}

//This is the (somewhat contrived) task that runs in a seperate thread
-(void)doMassiveTask1:(id)obj
{   
    //Notify the main thread the task is about to start (reset the UI)
    [self performSelectorOnMainThread:@selector(beginTask1:) withObject:nil waitUntilDone:NO];
    NSNumber *iter = (NSNumber*)obj;
    NSUInteger Niter = [iter intValue];
    
    //Perform costly (and blocking) operation
    for (NSUInteger idx = 0; ((idx < Niter) && (self.thread1Finished == NO)); idx++) {
        usleep(500000);
        float val = (float)(idx+1)/(float)Niter;
        //Notify main thread (GUI) of the progress made so far
        [self performSelectorOnMainThread:@selector(callBack1:) withObject:[NSNumber numberWithFloat:val] waitUntilDone:YES];
    }
    
    //Tidy up - tell main thread all is done
    [self performSelectorOnMainThread:@selector(task1IsDone:) withObject:nil waitUntilDone:NO];
}
//This is called every 30s
-(void)watchDog1:(NSTimer*)tmr
{
    [self performSelectorOnMainThread:@selector(logOnMainThread:) withObject:@"Timer is running - all is well" waitUntilDone:NO];    
}


-(void)doMassiveTask2:(id)obj
{
    @autoreleasepool {
        NSUInteger Niter = 10;
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

-(void)callBackWhenRunLoopIsDone:(id)obj
{
    [self updateActivityIndicator];
    self.thread1 = nil;
    callBackBlock(YES);    
}

-(void)callBack1:(id)obj
{
    NSNumber *num = (NSNumber*)obj;
    float u = [num floatValue];
    self.progressBar1.progress = u;
}
-(void)beginTask1:(id)obj
{
    self.progressBar1.progress = 0.0;
    _task1Processing = YES;    
    [self updateActivityIndicator];
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
//NSLog is not thread safe - so only call it on the main thread in this example
-(void)logOnMainThread:(NSString*)message {
    NSLog(@"%@", message);
}

@end
