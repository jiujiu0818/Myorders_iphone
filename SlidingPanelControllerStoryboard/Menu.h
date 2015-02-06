//
//  Menu.h
//  OrderManagement
//
//  Created by 金 秋瑞 on 3/26/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Menu : NSObject{
	NSString * _id;
	NSString *_name;
	NSString *_price;
    NSString *_pic;
    NSString *_intro;
    NSString *_categoryID;
    NSNumber *_scoreCount;
    NSNumber *_allScore;
}

+ (NSMutableArray *) findAll;
+ (NSMutableArray *) findByCategory:(NSString *)categoryID;
- (NSString *) ID;
- (NSString *) name;
- (NSString *) price;
- (NSString *) pic;
- (NSString *) intro;
- (NSString *) categoryID;
- (NSNumber *) scoreCount;
- (NSNumber *) allScore;
- (id) initWithID:(NSString *) ID name:(NSString *) name price:(NSString *)price pic:(NSString *) pic intro:(NSString *) intro categoryID: (NSString *) categoryID scoreCount:(NSNumber *)scoreCount allSocre:(NSNumber *)allScore;
+ (int) createWithID:(NSString *) ID name:(NSString *) name price:(NSString *)price;
+ (int) delete:(NSString *) ID;
@end
