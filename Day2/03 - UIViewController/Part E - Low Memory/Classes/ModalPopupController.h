//
//  ModalPopupController.h
//  Nibbly
//
//  Created by noutram on 09/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalPopupControllerDelagate <NSObject>

-(void)ModalPopupControllerDone;

@end


#pragma mark class declatation
@interface ModalPopupController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {

    id<ModalPopupControllerDelagate> delegate;
    UIPickerView *picker;
    NSArray *items;
    NSString *selectedItem;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil 
             delegate:(id<ModalPopupControllerDelagate>)d;

#pragma mark properties
@property(readwrite,nonatomic,assign) id<ModalPopupControllerDelagate> delegate;
@property(readwrite, nonatomic, retain) NSArray *items;
@property(readwrite, nonatomic, copy) NSString *selectedItem;
#pragma mark actions
-(IBAction)didTouchDownButton;
@end
