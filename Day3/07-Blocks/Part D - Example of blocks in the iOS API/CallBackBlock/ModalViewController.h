//
//  ModalViewController.h
//  SingletonModel
//
//  Created by Nicholas Outram on 13/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ModalViewControllerCallBackBlock)(NSString *newValue, BOOL didChange);

@interface ModalViewController : UIViewController<UITextFieldDelegate> {

    ModalViewControllerCallBackBlock dismissBlock;
    UITextField *textInputBox;
}

@property (nonatomic, retain) IBOutlet UITextField *textInputBox;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil callBack:(ModalViewControllerCallBackBlock)cb;

- (IBAction)saveButtonTouched:(id)sender;
- (IBAction)cancelButtonTouched:(id)sender;


@end
