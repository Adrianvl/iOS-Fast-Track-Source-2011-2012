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
@synthesize stopButton;
@synthesize task1AProgressBar;
@synthesize task1BProgressBar;
@synthesize task2AProgressBar;
@synthesize task3AProgressBar;

-(void)awakeFromNib
{
//    self.started = NO;
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
    [stopButton release];
    [task1AProgressBar release];
    [task1BProgressBar release];
    [task2AProgressBar release];
    [task3AProgressBar release];
    [super dealloc];
}
- (IBAction)doStartButton:(id)sender {
    self.task1AProgressBar.progress = 0.0;
    self.task1BProgressBar.progress = 0.0;
    self.task2AProgressBar.progress = 0.0;
    self.task3AProgressBar.progress = 0.0;
    self.startButton.enabled = NO;
    self.stopButton.enabled = YES;

    //Blocks
    void(^block1A)(void) = ^(void) {
        for (size_t n=0; n<100; n++) {
            for (size_t m=0; m<100; m++) {
                usleep(100);                
            }
            //Update progress bar on main thread
            [self performSelectorOnMainThread:@selector(block1AHasProgressed:) withObject:[NSNumber numberWithFloat:(float)n/100.0] waitUntilDone:NO];
        }        
    };

    void(^block1B)(void) = ^(void) {
        for (size_t n=0; n<100; n++) {
            for (size_t m=0; m<100; m++) {
                usleep(100);                
            }
            //Update progress bar on main thread
            [self performSelectorOnMainThread:@selector(block1BHasProgressed:) withObject:[NSNumber numberWithFloat:(float)n/100.0] waitUntilDone:NO];
        }        
    };
    
    void(^block2A)(void) = ^(void) {
        for (size_t n=0; n<100; n++) {
            for (size_t m=0; m<100; m++) {
                usleep(150);                
            }
            //Update progress bar on main thread
            [self performSelectorOnMainThread:@selector(block2AHasProgressed:) withObject:[NSNumber numberWithFloat:(float)n/100.0] waitUntilDone:NO];

        }        
    };
    
    void(^block3A)(void) = ^(void) {
        for (size_t n=0; n<100; n++) {
            for (size_t m=0; m<100; m++) {
                usleep(100);                
            }
            //Update progress bar on main thread
            [self performSelectorOnMainThread:@selector(block3AHasProgressed:) withObject:[NSNumber numberWithFloat:(float)n/100.0] waitUntilDone:NO];
        }        
    };

    //This will be called on the main thread (NSLog should only be called on the main thread)
    void(^blockFinal)(void) = ^(void) {
        NSLog(@"This is the final operation, running on the main thread");
        self.startButton.enabled = YES;
        self.stopButton.enabled = NO;          
        if (operationQueue) {
            [operationQueue release];
            operationQueue = nil;        
        }         
    };
                                   
    //Setup block operations and their dependancies
    NSBlockOperation *blockOperation1A = [NSBlockOperation blockOperationWithBlock:block1A];
    NSBlockOperation *blockOperation1B = [NSBlockOperation blockOperationWithBlock:block1B];
    [blockOperation1B addDependency:blockOperation1A];

    NSBlockOperation *blockOperation2A = [NSBlockOperation blockOperationWithBlock:block2A];
    NSBlockOperation *blockOperation3A = [NSBlockOperation blockOperationWithBlock:block3A];
    [blockOperation3A addDependency:blockOperation1B];
    [blockOperation3A addDependency:blockOperation2A];
    
    NSBlockOperation *blockOperationFinal = [NSBlockOperation blockOperationWithBlock:blockFinal];
    [blockOperationFinal addDependency:blockOperation3A];
            
    //NSOperation queue of all the concurrent blocks
    NSArray *arrayOfOperations = [NSArray arrayWithObjects:
                                  blockOperation1A, blockOperation1B,
                                  blockOperation2A,
                                  blockOperation3A, nil];    

    // ********************
    // Queue up all tasks *
    // ********************

    //These can run on seperate threads
    operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperations:arrayOfOperations waitUntilFinished:NO];

    //Run the last block on the queue for the main thread (handled by the main thread run loop)
    //Note that it still honours the dependancy on block 3A completing
    [[NSOperationQueue mainQueue] addOperation:blockOperationFinal];
    
}

//UI Update methods (to be called on the main thread)
-(void)block1AHasProgressed:(id)obj
{
    NSNumber *val = (NSNumber*)obj;
    self.task1AProgressBar.progress = [val floatValue];
}
-(void)block1BHasProgressed:(id)obj
{
    NSNumber *val = (NSNumber*)obj;
    self.task1BProgressBar.progress = [val floatValue];
}
-(void)block2AHasProgressed:(id)obj
{
    NSNumber *val = (NSNumber*)obj;
    self.task2AProgressBar.progress = [val floatValue];
}
-(void)block3AHasProgressed:(id)obj
{
    NSNumber *val = (NSNumber*)obj;
    self.task3AProgressBar.progress = [val floatValue];
}


- (IBAction)doStopButton:(id)sender {
    [operationQueue cancelAllOperations];
}
@end
