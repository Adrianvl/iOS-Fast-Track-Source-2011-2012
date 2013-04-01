//
//  SimpleController.h
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SimpleController : NSObject {
    UIView *view;
    UIButton *button;
    UILabel *label;
}

@property(readwrite, nonatomic, retain) IBOutlet UIView *view;
@property(readwrite, nonatomic, retain) IBOutlet UIButton *button;
@property(readwrite, nonatomic, retain) IBOutlet UILabel *label;

- (id) initWithNibName:(NSString*)nibName;
@end
