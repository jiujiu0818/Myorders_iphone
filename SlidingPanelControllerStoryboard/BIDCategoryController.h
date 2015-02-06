//
//  BIDCategoryController.h
//  MyOrders
//
//  Created by 金 秋瑞 on 3/7/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"

@interface BIDCategoryController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate,
UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,SGFocusImageFrameDelegate>
{
    NSMutableArray *allCategory;
}
@property (strong, nonatomic) NSArray *category;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong,nonatomic) NSString *storeID;
- (IBAction)showMenu;
@end
