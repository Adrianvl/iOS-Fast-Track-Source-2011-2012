//
//  SoCMViewController.h
//  HelloWorld4iPhone
//
//  Created by Nicholas Outram on 27/09/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

//This is our view controller. In this version, we only need to list out method declarations.
//Note that no iVars appear here (as this is an interface)

#import <UIKit/UIKit.h>

@interface SoCMViewController : UIViewController {
    //You can put iVars here (backwards compatibiity?)
    //However, this is an interface, so it is considered better practise to not do this
}

//The sole event handler
// IBAction is defined as void, but also flags to Interface Builder that this is an Action (event handler)
-(IBAction)doButtonTouched:(id)sender;

@end
