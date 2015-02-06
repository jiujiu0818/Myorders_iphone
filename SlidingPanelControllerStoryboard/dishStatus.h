//
//  dishStatus.h
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/20/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface dishStatus : NSObject

@property (strong,nonatomic) NSString *dishName;
//@property (strong,nonatomic) NSNumber *status;
@property (strong,nonatomic) NSString *tableNum;


-(dishStatus *)initWithName:(NSString *)name tableNum:(NSString *)tableNum;

@end
