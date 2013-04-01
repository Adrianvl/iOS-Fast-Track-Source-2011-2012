//
//  MainViewController.h
//  DefiningAndCallBlocks
//
//  Created by Nicholas Outram on 28/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#define MYMAXFACTORIAL 20

@interface MainViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource> {
    UILabel *_resultLabel;
    UIPickerView *_numberPicker;
}
@property (nonatomic, retain) IBOutlet UIPickerView *numberPicker;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UILabel *resultLabel;

- (IBAction)doButton:(id)sender;


@end
