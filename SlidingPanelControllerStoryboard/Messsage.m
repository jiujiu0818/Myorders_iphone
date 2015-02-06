//
//  Messsage.m
//  install2
//
//  Created by 金 秋瑞 on 5/14/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import "Messsage.h"

@implementation Messsage

@synthesize user;
@synthesize message;

- (NSString *) description
{
    return [NSString stringWithFormat:@"123%@         %@",user,message];
}

- (Messsage *) initWithUser:(NSString *) u message:(NSString *) mes
{
    self.user = u;
    self.message = mes;
    return self;
}

@end
