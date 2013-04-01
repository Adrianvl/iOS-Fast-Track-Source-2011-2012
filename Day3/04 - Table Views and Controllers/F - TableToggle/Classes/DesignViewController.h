//
//  DesignViewController.h
//  MyApp
//
//  Created by noutram on 27/12/2009.
//  Copyright 2009 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LogicTermTableController.h"
#import "TruthTableController.h"

@interface DesignViewController : UIViewController {
    //UI State
    UIToolbar *toolBar;
    LogicTermTableController *ltVC;
    TruthTableController *ttVC;
    NSNumber *mode;
    
    //Model Data
    
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolBar;
@property (nonatomic, retain) LogicTermTableController *ltVC;
@property (nonatomic, retain) TruthTableController *ttVC;
@property (nonatomic, retain) NSNumber *mode;

-(void)selectViewForMode;

-(IBAction)doToggle:(id)sender;


@end
