//
//  BIDViewController.h
//  CellTest
//
//  Created by 金 秋瑞 on 4/28/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HVTableView.h"
#import "RatingView.h"

@interface BIDViewController : UIViewController<HVTableViewDelegate, HVTableViewDataSource,RatingViewDelegate,UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>
{
	HVTableView* myTable;
	NSArray* cellTitles;
    NSMutableArray *allMenu;

}
@property (strong,nonatomic) RatingView *ratingView;
@property (strong,nonatomic) UILabel *labelPrice;
@property (strong,nonatomic) NSString *categoryID;
@end
