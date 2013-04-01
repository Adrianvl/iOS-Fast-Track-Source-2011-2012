//
//  MainViewController.h
//  PlainTable
//
//  Created by Nicholas Outram on 30/03/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    
    UITableViewCellEditingStyle editingMode;
	UITableView *tableView;
	Model *model;
}

@property(readwrite, nonatomic, retain) IBOutlet UITableView *tableView;
@property(readwrite, nonatomic, retain) Model *model;
@property(readwrite) UITableViewCellEditingStyle editingMode;
@end
