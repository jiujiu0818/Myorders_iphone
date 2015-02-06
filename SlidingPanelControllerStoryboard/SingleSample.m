//
//  SingleSample.m
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 4/21/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import "SingleSample.h"

@implementation SingleSample
@synthesize myOrder;
@synthesize storeID;

+ (SingleSample *)sharedSingleSample
{
    static SingleSample *sharedSingleSample = nil;
    
    @synchronized(self)
    {
        if (!sharedSingleSample)
            sharedSingleSample = [[SingleSample alloc] init];
        return sharedSingleSample;
    }
}

@end
