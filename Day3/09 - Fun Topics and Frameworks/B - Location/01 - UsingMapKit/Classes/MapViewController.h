//
//  MapViewController.h
//  UsingMapKit
//
//  Created by Nicholas Outram on 01/04/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate> {
	MKMapView *map;
	UIButton *btn;
	UILabel *latLabel;
	UILabel *longLabel;
}

@property(readwrite, nonatomic, retain) IBOutlet MKMapView *map;
@property(readwrite, nonatomic, retain) IBOutlet UIButton *btn;
@property(readwrite, nonatomic, retain) IBOutlet UILabel *latLabel;
@property(readwrite, nonatomic, retain) IBOutlet UILabel *longLabel;

-(IBAction)buttonTouchedDown:(id)sender;
-(void)updateLabelsWithCoords;

@end
