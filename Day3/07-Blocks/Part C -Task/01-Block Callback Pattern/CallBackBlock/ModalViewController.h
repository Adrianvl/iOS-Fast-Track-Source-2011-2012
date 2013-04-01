//
//  ModalViewController.h
//  SingletonModel
//
//  Created by Nicholas Outram on 13/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UIViewController<UITextFieldDelegate> {

    UITextField *textInputBox;
}

@property (nonatomic, retain) IBOutlet UITextField *textInputBox;


- (IBAction)saveButtonTouched:(id)sender;
- (IBAction)cancelButtonTouched:(id)sender;


@end
