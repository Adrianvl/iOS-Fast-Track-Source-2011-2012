//
//  TableExample2ViewController.h
//  TableExample2
//
//  Created by Nicholas Outram on 04/01/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableExample2ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	UITableView *myTable;
}

@property(readwrite, nonatomic, retain) IBOutlet UITableView *myTable;

@end

