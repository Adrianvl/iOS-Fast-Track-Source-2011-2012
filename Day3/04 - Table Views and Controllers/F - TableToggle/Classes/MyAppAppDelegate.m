//
//  MyAppAppDelegate.m
//  MyApp
//
//  Created by noutram on 27/12/2009.
//  Copyright University of Plymouth 2009. All rights reserved.
//

#import "MyAppAppDelegate.h"

@implementation MyAppAppDelegate

@synthesize window, nc;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    DesignViewController *dvc = [[DesignViewController alloc] initWithNibName:@"DesignViewController" bundle:nil];
    nc = [[UINavigationController alloc] initWithRootViewController:dvc];
    nc.navigationBar.barStyle = UIBarStyleBlack;
    nc.toolbar.barStyle = UIBarStyleBlack;
    [dvc release];
    
    nc.toolbarHidden = NO;
    
    window.rootViewController = nc;
    [nc release];
    [window makeKeyAndVisible];
    
}


- (void)dealloc {
    self.nc = nil;
    [window release];
    [super dealloc];
}


@end
