//
//  DAHomeViewController.h
//  DoubanAlbum
//
//  Created by Tonny on 12-12-8.
//  Copyright (c) 2012年 SlowsLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAHomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UIAlertViewDelegate>{
    
    __weak IBOutlet UITableView *_tableView;
    
    UIButton                *_refreshBtn;
    
    NSUInteger              _lastSelectedRow;
}

- (IBAction)showMenu;
@property (strong,nonatomic) NSArray *nameTexts;
@property (strong,nonatomic) NSArray *userTexts;

@end
