//
//  FindingYourselfAppDelegate.h
//  FindingYourself
//
//  Created by noutram on 25/05/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"


@interface FindingYourselfAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	MainViewController *mvc;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mvc;
@end

