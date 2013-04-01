//
//  ViewController.h
//  PersonDetails
//
//  Created by Nicholas Outram on 28/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "NSBundleUOPCategory.h"

@interface ViewController : UIViewController <UITextFieldDelegate> {

}

//Logic
-(void)updateViewWithModel;
-(BOOL)updateModelWithView;

//ACCESSORS
@property (readwrite, nonatomic, strong) Person *model;

//ACTIONS
-(IBAction)doToggle:(id)sender;

@end
