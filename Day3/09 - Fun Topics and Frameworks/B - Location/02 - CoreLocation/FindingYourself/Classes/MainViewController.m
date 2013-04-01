//
//  MainViewController.m
//  FindingYourself
//
//  Created by noutram on 25/05/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>


@implementation MainViewController
@synthesize locationLabel;
@synthesize headingLabel;
@synthesize lm;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		lm = [[CLLocationManager alloc] init];
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Not all devices support heading data
    if ([CLLocationManager headingAvailable] == NO) {
        self.headingLabel.text = @"Not available";
        self.headingLabel.textColor = [UIColor grayColor];
    }
}


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
    [self setLocationLabel:nil];
    [self setHeadingLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[lm stopUpdatingHeading];
	[lm stopUpdatingLocation];
	lm.delegate = nil;
	self.lm = nil;
    [locationLabel release];
    [headingLabel release];
    [super dealloc];
}

-(IBAction)toggleGPSState:(id)sender
{

	if (lm.delegate == nil) {
		NSLog(@"Toggle On");
		self.lm.delegate = self;
		self.lm.desiredAccuracy = kCLLocationAccuracyBest;
		self.lm.distanceFilter = kCLDistanceFilterNone;
		[self.lm startUpdatingLocation];
        [self.lm startUpdatingHeading];
		//[self.lm stopUpdatingHeading];			
	} else {
		NSLog(@"Toggle Off");
		[lm stopUpdatingHeading];
		[lm stopUpdatingLocation];
		self.lm.delegate = nil;
	}

}

#pragma mark -
#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	NSLog(@"new location is %@", newLocation);
    self.locationLabel.text = [NSString stringWithFormat:@"LAT:%3.4f, LONG:%3.4f", newLocation.coordinate.latitude, newLocation.coordinate.longitude];
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
	NSLog(@"new heading is %@", newHeading);
    CLLocationDirection th = newHeading.trueHeading;
    CLLocationDirection mh = newHeading.magneticHeading;
    self.headingLabel.text = [NSString stringWithFormat:@"TRUE:%3.4f, MAG:%3.4f", th, mh];
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"ERROR: %@", error);
	[lm stopUpdatingHeading];
	[lm stopUpdatingLocation];
	self.lm.delegate = nil;	
}



@end
