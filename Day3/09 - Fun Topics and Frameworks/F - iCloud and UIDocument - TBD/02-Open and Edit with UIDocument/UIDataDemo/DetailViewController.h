//
//  DetailViewController.h
//  UIDataDemo
//
//  Created by Nicholas Outram on 10/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSBundleUOPCategory.h"
#import "ModelClass.h"

@interface DetailViewController : UIViewController <UITextFieldDelegate>

//Local Data
@property(strong, nonatomic) ModelClass *model;
//@property(strong, nonatomic) NSString *name;
//@property(strong, nonatomic) NSString *age;
@property(strong, nonatomic) NSString *fileid;
@property(assign, nonatomic) BOOL isNewDocument;


//Outlets
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UILabel *fidTextField;
@property (strong, nonatomic) void(^dissmissAndSave)(BOOL);

//Actions
- (IBAction)doSave:(id)sender;
- (IBAction)doCancel:(id)sender;

//Document management
-(void)saveAndOverwriteOrCreate:( void(^)(BOOL) )completionBlock;
@end
