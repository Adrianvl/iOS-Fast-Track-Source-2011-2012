//
//  TabbyAppDelegate.m
//  Tabby
//
//  Created by Nicholas Outram on 11/02/2010.
//  Copyright Apple Inc 2010. All rights reserved.
//

#import "TabbyAppDelegate.h"
#import "ViewController1.h"
#import "ViewController2.h"

@implementation TabbyAppDelegate
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
	//Create an array of view controllers
	ViewController1 *vc1 = [[ViewController1 alloc] initWithNibName:@"ViewController1" bundle:nil];
	ViewController2 *vc2 = [[ViewController2 alloc] initWithNibName:@"ViewController2" bundle:nil];
    
	NSArray *viewControllers = [NSArray arrayWithObjects:vc1, vc2, nil];
    
    //The array will retain these if it needs to, so it is safe to release them
    [vc1 release];
    [vc2 release];
    
	//Tabview controller
	UITabBarController *tbc = [[UITabBarController alloc] init];        //This will persist through out the app
	tbc.viewControllers = viewControllers;

	//Add to the window
    self.window.rootViewController = tbc;
    [tbc release];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
