//
//  album.h
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/31/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface album : NSObject
{
    NSString *_id;
    NSString *_name;
    NSString *_user;
    NSString *_pic;
}

+ (NSMutableArray *) findAll;
- (id) initWithID:(NSString *) ID name:(NSString *) name pic:(NSString *)pic user:(NSString *)user;
- (NSString *)name;
- (NSString *)ID;
- (NSString *)pic;
- (NSString *)user;
+ (int) createWithID:(NSString *) ID name:(NSString *) name user:(NSString *)user pic:(NSString *)pic;


@end
