//
//  HWViewController.h
//  HelloWorld
//
//  Created by Nicholas Outram on 25/03/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HWViewController : UIViewController {

	UILabel *message;
	UIButton *button;
	
}

@property(readwrite, nonatomic, retain) IBOutlet UILabel *message;
@property(readwrite, nonatomic, retain) IBOutlet UIButton *button;

-(IBAction)showMessage:(id)sender;

@end
