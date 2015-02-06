//
//  Messsage.h
//  install2
//
//  Created by 金 秋瑞 on 5/14/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Messsage : NSObject

@property (strong,nonatomic) NSString *user;
@property (strong,nonatomic) NSString *message;
-(Messsage *)initWithUser:(NSString *)a message:(NSString *)b;
@end
