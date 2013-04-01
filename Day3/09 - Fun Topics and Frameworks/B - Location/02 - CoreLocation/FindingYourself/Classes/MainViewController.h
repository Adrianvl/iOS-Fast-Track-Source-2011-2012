//
//  MainViewController.h
//  FindingYourself
//
//  Created by noutram on 25/05/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

// Couple important notes....
//
// (i)  You must add the core location framework to the target
//
// (ii) You must include CoreLocation.h 

@interface MainViewController : UIViewController <CLLocationManagerDelegate> {

	CLLocationManager *lm;	
	IBOutlet UIButton *btnStartStop;
    UILabel *locationLabel;
    UILabel *headingLabel;
}

@property (readwrite, nonatomic, retain) CLLocationManager *lm;

-(IBAction)toggleGPSState:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *locationLabel;
@property (nonatomic, retain) IBOutlet UILabel *headingLabel;

@end
