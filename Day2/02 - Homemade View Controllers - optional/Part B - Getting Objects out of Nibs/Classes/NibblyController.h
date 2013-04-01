//
//  NibblyController.h
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleController.h"


@interface NibblyController : NSObject {
    UIView *view;
    UIButton *button;
    UILabel *label;
    
    SimpleController *otherViewController;
}

@property (readwrite, nonatomic, retain) IBOutlet UIView *view;
@property (readwrite, nonatomic, retain) IBOutlet UIButton *button;
@property (readwrite, nonatomic, retain) IBOutlet UILabel *label;

@property (readwrite, nonatomic, retain) SimpleController *otherViewController;

- (id) initWithNibName:(NSString*)nibName;
-(IBAction)doSomething:(id)sender;

@end
