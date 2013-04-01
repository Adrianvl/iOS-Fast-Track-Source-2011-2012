//
//  MapViewController.m
//  UsingMapKit
//
//  Created by Nicholas Outram on 01/04/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController
@synthesize map,btn;
@synthesize latLabel;
@synthesize longLabel;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	MKCoordinateRegion cr;
	cr.center.latitude = 39.7;
	cr.center.longitude = -8.8;
	cr.span.latitudeDelta = 0.25;
	cr.span.longitudeDelta = 0.25;
	[map setRegion:cr animated:YES];
	[map setMapType:MKMapTypeHybrid];
	[self updateLabelsWithCoords];
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
	self.map.delegate = nil;
	self.map = nil;
	self.btn = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark Actions
-(IBAction)buttonTouchedDown:(id)sender
{
	MKCoordinateRegion cr;
	cr = self.map.region;
	NSLog(@"Button touched down");

	
	MKUserLocation *userLoc = [map userLocation];
	CLLocation *loc = [userLoc location];
	cr.center.latitude = loc.coordinate.latitude;
	cr.center.longitude = loc.coordinate.longitude;
	[map setRegion:cr];
	
}

#pragma mark MVC coordination
-(void)updateLabelsWithCoords
{
	MKCoordinateRegion cr;
	cr = self.map.region;	 
	self.latLabel.text = [NSString stringWithFormat:@"%3.5f", cr.center.latitude];
	self.longLabel.text = [NSString stringWithFormat:@"%3.5f", cr.center.longitude];
}

#pragma mark -
#pragma mark <MKMapViewDelegate>
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	MKCoordinateRegion region = self.map.region;
	NSLog(@"Map location changed to %3.3f, %3.3f", region.center.latitude, region.center.longitude);
	[self updateLabelsWithCoords];
}

@end
