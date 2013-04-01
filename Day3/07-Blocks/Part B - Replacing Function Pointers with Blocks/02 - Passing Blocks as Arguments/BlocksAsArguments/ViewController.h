//
//  ViewController.h
//  BlocksAsArguments
//
//  Created by Nicholas Outram on 02/11/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UILabel *messageLabel;
@property (retain, nonatomic) IBOutlet UIButton *block1Button;
@property (retain, nonatomic) IBOutlet UIButton *block2Button;
@property (retain, nonatomic) IBOutlet UIButton *resetButton;
@property (retain, nonatomic) NSDate* startTime;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSMutableArray *data;


- (IBAction)doButtonTouched:(id)sender;
-(void)doSort:( BOOL(^)(int,int))sortBlock;


@end
