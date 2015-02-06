//
//  storeRankController.h
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/22/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface storeRankController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) NSArray *storeName;
@property (strong,nonatomic) NSArray *storePoints;
@end
