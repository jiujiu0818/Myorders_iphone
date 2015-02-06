//
//  orderController.h
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/1/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface orderController : UITabBarController

- (IBAction)showMenu;
@property (strong,nonatomic) NSString *storeID;

@end
