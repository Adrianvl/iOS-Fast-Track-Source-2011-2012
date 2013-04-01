//
//  MainViewController.m
//  TiltNShake
//
//  Created by noutram on 18/05/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController
@synthesize xAccLabel;
@synthesize yAccLabel;
@synthesize zAccLabel;
@synthesize xProgressBar;
@synthesize yProgressBar;
@synthesize zProgressBar;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		[[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0/10.0];
		[[UIAccelerometer sharedAccelerometer] setDelegate:self];

    }
    return self;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [self setXAccLabel:nil];
    [self setYAccLabel:nil];
    [self setZAccLabel:nil];
    [self setXProgressBar:nil];
    [self setYProgressBar:nil];
    [self setZProgressBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[[UIAccelerometer sharedAccelerometer] setDelegate:nil];
    [xAccLabel release];
    [yAccLabel release];
    [zAccLabel release];
    [xProgressBar release];
    [yProgressBar release];
    [zProgressBar release];
    [super dealloc];
}

#pragma mark UIAccelerometerDelegate
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	float x = [acceleration x];
	float y = [acceleration y];
	float z = [acceleration z];
    self.xAccLabel.text = [NSString stringWithFormat:@"%3.3f", x];
    self.yAccLabel.text = [NSString stringWithFormat:@"%3.3f", y];
    self.zAccLabel.text = [NSString stringWithFormat:@"%3.3f", z];
    self.xProgressBar.progress = (x+1.0)/2.0;
    self.yProgressBar.progress = (y+1.0)/2.0;
    self.zProgressBar.progress = (z+1.0)/2.0;
    
//	NSLog(@"x=%3.3f, y=%3.3f, z=%3.3f", x,y,z);
}

@end
