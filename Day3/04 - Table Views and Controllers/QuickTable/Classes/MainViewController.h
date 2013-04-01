//
//  MainViewController.h
//  QuickTable
//
//  Created by Nicholas Outram on 30/03/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
	UITableView *tblView;
}

@property(readwrite, nonatomic, retain) IBOutlet UITableView *tblView;
@end
