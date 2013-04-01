//
//  AlternativeViewController.h
//  Nibbly
//
//  Created by noutram on 08/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AlternativeViewController : UIViewController {
    UIButton *button;
    UIButton *dismissButton;
    UILabel *label;
}

@property (readwrite, nonatomic, retain) IBOutlet UIButton *button;
@property (readwrite, nonatomic, retain) IBOutlet UIButton *dismissButton;
@property (readwrite, nonatomic, retain) IBOutlet UILabel *label;
-(IBAction)doSomethingElse:(id)sender;
-(IBAction)goAway:(id)sender;

@end


