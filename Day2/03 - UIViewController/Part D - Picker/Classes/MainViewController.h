//
//  MainViewController.h
//  Nibbly
//
//  Created by noutram on 08/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalPopupController.h"


@interface MainViewController : UIViewController <ModalPopupControllerDelagate> {

    UIView *containerView;
    UIToolbar *toolBar;
    UIBarButtonItem *btnAbout;  
    UILabel *instructionLabel;
    UIImageView *mugShot;
    
    ModalPopupController *mpc;
    
}
@property (readwrite, nonatomic, retain) IBOutlet UIView *containerView;
@property (readwrite, nonatomic, retain) IBOutlet UIToolbar *toolBar;
@property (readwrite, nonatomic, retain) IBOutlet UIBarButtonItem *btnAbout;
@property (readwrite, nonatomic, retain) IBOutlet UILabel *instructionLabel;
@property (readwrite, nonatomic, retain) IBOutlet UIImageView *mugShot;
@property (readwrite, nonatomic, retain) ModalPopupController *mpc;

-(IBAction) buttonAboutTouchedDown:(id)sender;

@end
