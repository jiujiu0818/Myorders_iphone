//
//  SingleSample.h
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 4/21/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleSample : NSObject

@property (nonatomic, retain) NSMutableArray *myOrder;
@property (nonatomic, retain) NSString *storeID;
+ (SingleSample *)sharedSingleSample;

@end