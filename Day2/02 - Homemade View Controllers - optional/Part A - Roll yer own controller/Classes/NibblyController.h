//
//  NibblyController.h
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright 2010 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NibblyController : NSObject {
    UIView *view;
    UIButton *button;
}

@property (readwrite, nonatomic, retain) IBOutlet UIView *view;
@property (readwrite, nonatomic, retain) IBOutlet UIButton *button;

- (id) initWithNibName:(NSString*)nibName;
-(IBAction)doSomething:(id)sender;

@end
