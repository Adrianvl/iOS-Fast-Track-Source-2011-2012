//
//  DetailModalViewController.h
//  PlainTable
//
//  Created by Nicholas Outram on 29/06/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailModalViewController : UIViewController {
    NSString *nameString;
    
    UILabel *titleLabel;
    UITextField *animalNameTextField;
    id delegate;
    UIButton *buttonOK;
}
@property (nonatomic, copy) NSString* nameString;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UITextField *animalNameTextField;
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) IBOutlet UIButton *buttonOK;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil name:(NSString*)nameStr delegate:(id)del forEdit:(BOOL)forEditing;


- (IBAction)buttonTouched:(id)sender;
@end
