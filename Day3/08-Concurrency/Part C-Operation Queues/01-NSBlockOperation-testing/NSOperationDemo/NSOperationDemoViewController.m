//
//  NSOperationDemoViewController.m
//  NSOperationDemo
//
//  Created by Nicholas Outram on 20/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "NSOperationDemoViewController.h"

@implementation NSOperationDemoViewController

@synthesize startButton;
@synthesize pauseButton;
@synthesize stopButton;
@synthesize task1AProgressBar;
@synthesize task1BProgressBar;
@synthesize task2AProgressBar;
@synthesize task3AProgressBar;

@synthesize started;

-(void)awakeFromNib
{
    self.started = NO;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setStartButton:nil];
    [self setPauseButton:nil];
    [self setStopButton:nil];
    [self setTask1AProgressBar:nil];
    [self setTask1BProgressBar:nil];
    [self setTask2AProgressBar:nil];
    [self setTask3AProgressBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (YES);
}

- (void)dealloc {
    [startButton release];
    [pauseButton release];
    [stopButton release];
    [task1AProgressBar release];
    [task1BProgressBar release];
    [task2AProgressBar release];
    [task3AProgressBar release];
    [super dealloc];
}
- (IBAction)doStartButton:(id)sender {
    
    //Reset UI
    self.task1AProgressBar.progress = 0.0;
    self.task1BProgressBar.progress = 0.0;
    self.task2AProgressBar.progress = 0.0;
    self.task3AProgressBar.progress = 0.0;
    self.startButton.enabled = NO;
    
    //Blocks
    void(^block1A)(void) = ^(void) {
        for (size_t n=0; n<100; n++) {
            for (size_t m=0; m<100; m++) {
                usleep(100);                
            }
            //Update progress bar on main thread
            //TODO
        }        
    };

    void(^block1B)(void) = ^(void) {
        for (size_t n=0; n<100; n++) {
            for (size_t m=0; m<100; m++) {
                usleep(100);                
            }
            //Update progress bar on main thread
            //TODO
        }        
    };
    
    void(^block2A)(void) = ^(void) {
        for (size_t n=0; n<100; n++) {
            for (size_t m=0; m<100; m++) {
                usleep(150);                
            }
            //Update progress bar on main thread
            //TODO
        }        
    };
    
    void(^block3A)(void) = ^(void) {
        for (size_t n=0; n<100; n++) {
            for (size_t m=0; m<100; m++) {
                usleep(100);                
            }
            //Update progress bar on main thread
            //TODO
        }        
    };
    
    //Setup block operations
    NSBlockOperation *blockOperation1A = [NSBlockOperation blockOperationWithBlock:block1A];
    NSBlockOperation *blockOperation1B = [NSBlockOperation blockOperationWithBlock:block1B];
    [blockOperation1B addDependency:blockOperation1A];

    NSBlockOperation *blockOperation2A = [NSBlockOperation blockOperationWithBlock:block2A];
    
    NSBlockOperation *blockOperation3A = [NSBlockOperation blockOperationWithBlock:block3A];
    [blockOperation3A addDependency:blockOperation1B];
    [blockOperation3A addDependency:blockOperation2A];
    
    NSArray *arrayOfOperations = [NSArray arrayWithObjects:
                                  blockOperation1A, blockOperation1B,
                                  blockOperation2A,
                                  blockOperation3A, nil];
                                  
    
    //Operation queue - this example will BLOCK the main thread (for testing)
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperations:arrayOfOperations waitUntilFinished:YES];
    //TODO - modify the line above to be asynchronous
    
    //These will have to be removed for the task
    self.task1AProgressBar.progress = 1.0;
    self.task1BProgressBar.progress = 1.0;
    self.task2AProgressBar.progress = 1.0;
    self.task3AProgressBar.progress = 1.0;
    self.startButton.enabled = YES;
}

- (IBAction)doPauseButton:(id)sender {
}

- (IBAction)doStopButton:(id)sender {
    self.started = NO;
}
@end
