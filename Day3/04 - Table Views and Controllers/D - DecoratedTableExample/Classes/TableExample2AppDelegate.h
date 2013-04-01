//
//  TableExample2AppDelegate.h
//  TableExample2
//
//  Created by Nicholas Outram on 04/01/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableExample2ViewController;

@interface TableExample2AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TableExample2ViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TableExample2ViewController *viewController;

@end

