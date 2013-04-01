//
//  MainViewController.h
//  TiltNShake
//
//  Created by noutram on 18/05/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController <UIAccelerometerDelegate> {

}
@property (retain, nonatomic) IBOutlet UILabel *xAccLabel;
@property (retain, nonatomic) IBOutlet UILabel *yAccLabel;
@property (retain, nonatomic) IBOutlet UILabel *zAccLabel;
@property (retain, nonatomic) IBOutlet UIProgressView *xProgressBar;
@property (retain, nonatomic) IBOutlet UIProgressView *yProgressBar;
@property (retain, nonatomic) IBOutlet UIProgressView *zProgressBar;

@end
