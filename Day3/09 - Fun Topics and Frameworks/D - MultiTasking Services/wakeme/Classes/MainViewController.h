//
//  MainViewController.h
//  wakeme
//
//  Created by Nicholas Outram on 20/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

- (void)scheduleAlarmForDate:(NSDate*)theDate;
-(IBAction)createLocalNotifications:(id)sender;
-(IBAction)stopLocalNotications:(id)sender;    
@property (retain, nonatomic) IBOutlet UIImageView *clockFace;

@end
