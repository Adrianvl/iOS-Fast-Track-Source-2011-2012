//
//  CustomViewAppDelegate.h
//  CustomView
//
//  Created by noutram on 05/02/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Boxes.h"

@interface CustomViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Boxes *boxView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (readwrite, nonatomic, retain) Boxes *boxView;
@end

