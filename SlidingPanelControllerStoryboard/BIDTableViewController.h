//
//  BIDTableViewController.h
//  CellTest
//
//  Created by 金 秋瑞 on 4/28/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HVTableView.h"

@interface BIDTableViewController : UITableViewController<HVTableViewDelegate, HVTableViewDataSource>
{
	HVTableView* myTable;
	NSArray* cellTitles;
}

@end
