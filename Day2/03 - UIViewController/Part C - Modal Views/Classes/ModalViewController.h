//
//  ModalPopupController.h
//  Nibbly
//
//  Created by noutram on 09/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewControllerDelagate <NSObject>

-(void)ModalViewControllerDone;

@end


#pragma mark class declatation
@interface ModalViewController : UIViewController {

    id<ModalViewControllerDelagate> delegate;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil 
             delegate:(id<ModalViewControllerDelagate>)d;

#pragma mark properties
@property(readwrite,nonatomic,assign) id<ModalViewControllerDelagate> delegate;

#pragma mark actions
-(IBAction)didTouchDownButton;
@end
