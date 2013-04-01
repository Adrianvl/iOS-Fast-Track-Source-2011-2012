//
//  MainViewController.h
//  Nibbly
//
//  Created by noutram on 08/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlternativeViewController.h"


@interface MainViewController : UIViewController {

    UILabel *label;
    UIButton *button;
    AlternativeViewController *altVC;
}

@property (readwrite, nonatomic, retain) IBOutlet UILabel *label;
@property (readwrite, nonatomic, retain) IBOutlet UIButton *button;
@property (readwrite, nonatomic, retain) AlternativeViewController *altVC;
-(IBAction)doSomething:(id)sender;

@end
