//
//  SingletonModelViewController.h
//  SingletonModel
//
//  Created by Nicholas Outram on 12/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController {
    UILabel *messageLabel;
    NSString *messageString;
}
@property (nonatomic, retain) IBOutlet UILabel *messageLabel;
@property (nonatomic, retain) NSString *messageString;

- (IBAction)doSplat:(id)sender;


@end
