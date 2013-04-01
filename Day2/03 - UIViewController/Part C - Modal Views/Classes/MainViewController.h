//
//  MainViewController.h
//  Nibbly
//
//  Created by noutram on 08/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewController.h"


@interface MainViewController : UIViewController <ModalViewControllerDelagate> {

    UIView *containerView;
    UIToolbar *toolBar;
    UIBarButtonItem *btn1;
    UIBarButtonItem *btn2;
    UIBarButtonItem *btnClear;    
    UIBarButtonItem *btnAbout;  
    UILabel *instructionLabel;
    UIImageView *mugShot;
    
    ModalViewController *mpc;
    
}
@property (readwrite, nonatomic, retain) IBOutlet UIView *containerView;
@property (readwrite, nonatomic, retain) IBOutlet UIToolbar *toolBar;
@property (readwrite, nonatomic, retain) IBOutlet UIBarButtonItem *btnAbout;
@property (readwrite, nonatomic, retain) IBOutlet UILabel *instructionLabel;
@property (readwrite, nonatomic, retain) IBOutlet UIImageView *mugShot;
@property (readwrite, nonatomic, retain) ModalViewController *mpc;

-(IBAction) buttonAboutTouchedDown:(id)sender;

@end
