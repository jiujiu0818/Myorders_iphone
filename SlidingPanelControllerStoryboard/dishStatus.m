//
//  dishStatus.m
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/20/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import "dishStatus.h"

@implementation dishStatus

@synthesize dishName;
@synthesize tableNum;

-(dishStatus *)initWithName:(NSString *)name tableNum:(NSString *)tableNum1
{
    self.dishName = name;
    self.tableNum = tableNum1;
    return self;
}
- (NSString *) description
{
    return [NSString stringWithFormat:@"123%@         %@",self.dishName,self.tableNum];
}

@end
