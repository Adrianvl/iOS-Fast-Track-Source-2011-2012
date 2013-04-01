//
//  ViewController.h
//  PersonDetails
//
//  Created by Nicholas Outram on 28/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController {
  
    
}

//Logic
-(void)updateViewWithModel;

//ACCESSOTS
-(void)setModel:(Person*)newModel;
-(Person*)model;

//ACTIONS
-(IBAction)doToggle:(id)sender;

@end
