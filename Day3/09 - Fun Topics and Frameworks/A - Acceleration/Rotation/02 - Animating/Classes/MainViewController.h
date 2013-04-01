//
//  MainViewController.h
//  Resize
//
//  Created by noutram on 07/06/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController {
	UIImageView *catImage;
	UIImageView *tableImage;
}

@property (readwrite, nonatomic, retain) IBOutlet UIImageView *catImage;
@property (readwrite, nonatomic, retain) IBOutlet UIImageView *tableImage;


@end
