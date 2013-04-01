//
//  TabbyAppDelegate.h
//  Tabby
//
//  Created by Nicholas Outram on 11/02/2010.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController1.h"
#import "ViewController2.h"

@interface TabbyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@end

