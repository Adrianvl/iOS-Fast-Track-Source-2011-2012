//
//  MainViewController.m
//  wakeme
//
//  Created by Nicholas Outram on 20/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController {

}
@synthesize clockFace;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setClockFace:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma - Local Notification Stuff

- (void)scheduleAlarmForDate:(NSDate*)theDate
{
	UIApplication* app = [UIApplication sharedApplication];
	NSArray*    oldNotifications = [app scheduledLocalNotifications];
	
	// Clear out the old notification before scheduling a new one.
	if ([oldNotifications count] > 0)
		[app cancelAllLocalNotifications];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
	
	// Create a new notification
	UILocalNotification* alarm = [[[UILocalNotification alloc] init] autorelease];
	if (alarm)
	{
		alarm.fireDate = theDate;
		alarm.timeZone = [NSTimeZone defaultTimeZone];
		alarm.repeatInterval = kCFCalendarUnitMinute;
		alarm.soundName = @"default";
		alarm.alertBody = @"Participant Data still waiting to upload. Send to the University?";
		alarm.alertAction = @"Upload Data";
		alarm.alertLaunchImage = @"splash.png";
		
		
		[app scheduleLocalNotification:alarm];
	}
}	

-(IBAction)createLocalNotifications:(id)sender
{
	//Set up local notification
	[self scheduleAlarmForDate:[NSDate dateWithTimeIntervalSinceNow:15]];	//every 15 seconds	
    self.clockFace.hidden = NO;
}

-(IBAction)stopLocalNotications:(id)sender
{
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
	[[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    self.clockFace.hidden = YES;

}

- (void)dealloc {
    [clockFace release];
    [super dealloc];
}
@end
