//
//  ViewController.h
//  CustomView
//
//  Created by Nicholas Outram on 06/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Boxes.h"

@interface ViewController : UIViewController <UIScrollViewDelegate>
@property(readwrite, nonatomic, assign) Boxes *boxView;
@property (readwrite, nonatomic, retain) UIScrollView *scrollView;
@property (readwrite, retain) NSTimer *timer;
- (void)timerDidFire:(NSTimer*)theTimer;

@end
