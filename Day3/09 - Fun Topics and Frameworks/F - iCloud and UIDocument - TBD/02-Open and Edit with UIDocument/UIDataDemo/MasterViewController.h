//
//  MasterViewController.h
//  UIDataDemo
//
//  Created by Nicholas Outram on 10/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableCell.h"
#import "NSBundleUOPCategory.h"
#import "ModelClass.h"

@interface MasterViewController : UITableViewController

@property(readwrite, nonatomic, strong) NSMutableArray *fileList;
@property(readwrite, nonatomic, strong) ModelClass *openModel;

@end
