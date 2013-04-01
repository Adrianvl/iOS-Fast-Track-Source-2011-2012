//
//  PopViewController.h
//  PopUpDemo
//
//  Created by Nicholas Outram on 14/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionViewController.h"

@interface MainViewController : UIViewController<UIPopoverControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *popOverButton;
@property (readwrite, nonatomic, strong) UIPopoverController *poc;

- (IBAction)doPopover:(id)sender;

@end
