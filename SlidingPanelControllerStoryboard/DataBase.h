//
//  DataBase.h
//  OrderManagement
//
//  Created by 金 秋瑞 on 3/26/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <PlausibleDatabase/PlausibleDatabase.h>

@interface DataBase : NSObject {
    
}

+ (PLSqliteDatabase *) setup;

+ (void) close;

@end
