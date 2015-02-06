//
//  dbMap.h
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/6/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dbMap : NSObject
{
    NSString *_id;
    NSString *_name;
    NSNumber *_latitude;
    NSNumber *_longtitude;
    NSString *_address;
    NSString *_status;
    NSString *_open24;
    NSString *_phone;
    NSString *_features;
    NSString *_storeID;
    NSString *_pic;
}

+ (NSMutableArray *) findAll;
- (NSString *) ID;
- (NSString *) name;
- (NSNumber *) latitude;
- (NSNumber *) longtitude;
- (NSString *) address;
- (NSString *) status;
- (NSString *) open24;
- (NSString *) phone;
- (NSString *) features;
- (NSString *) storeID;
- (NSString *) pic;

- (id) initWithID:(NSString *) ID name:(NSString *) name latitude:(NSNumber *)latitude longtitude:(NSNumber *)longtitude address:(NSString *)address status:(NSString *) status open24:(NSString *) open24 phone: (NSString *) phone features: (NSString *) features  storeID: (NSString *) storeID  pic: (NSString *) pic;
+ (NSMutableArray *) findByStore:(NSString *)storeID;

@end
