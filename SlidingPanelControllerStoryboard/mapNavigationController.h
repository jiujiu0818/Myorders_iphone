//
//  mapNavigationController.h
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 4/23/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorldCity.h"
#import "dbMap.h"
@protocol mapNavigationControllerDelegate;

@interface mapNavigationController : UITableViewController<CLLocationManagerDelegate>
{
	NSMutableArray* cityList;
    BOOL addingNewPlace;
    id <mapNavigationControllerDelegate> delegate;
    NSMutableArray *allLocation;
}
@property (nonatomic, retain) NSMutableArray* cityList;
@property(nonatomic, strong) CLLocationManager *locmanager;
@property (strong,nonatomic) NSString *storeID;
@end

@protocol mapNavigationControllerDelegate//bushihendong
- (void)mapNavigationController:(mapNavigationController *)controller didChooseWorldCity:(WorldCity *)aPlace;
@end

