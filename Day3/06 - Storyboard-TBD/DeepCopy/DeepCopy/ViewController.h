//
//  ViewController.h
//  DeepCopy
//
//  Created by Nicholas Outram on 15/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface ViewController : UIViewController

@property(readwrite, nonatomic, retain) Model* model;

@end
