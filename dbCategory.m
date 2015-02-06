//
//  dbCategory.m
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/5/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import "dbCategory.h"
#import "DataBase.h"

@implementation dbCategory

+ (NSMutableArray *) findAll{
	PLSqliteDatabase *dataBase = [DataBase setup];
	
	id<PLResultSet> rs;
	rs = [dataBase executeQuery:@"SELECT * FROM Category"];
	
	//定义一个数组存放所有categpry的信息
	NSMutableArray *allCategory = [[NSMutableArray alloc] init];
	
	//把rs中的数据库信息遍历到books数组
	while ([rs next]) {
		NSString *ID = [rs objectForColumn:@"ID"];
		NSString *name = [rs objectForColumn:@"Name"];
		NSString *pic = [rs objectForColumn:@"Pic"];
    //    NSString *pic = @"123";
        NSString *store = [rs objectForColumn:@"Store"];
        
		//初始化book 存放到books里面
		dbCategory *category = [[dbCategory alloc] initWithID:ID name:name pic:pic store:store];
		[allCategory addObject:category];
        //		[Menu release];
	}
	//关闭数据库
	[rs close];
    return allCategory;
}
+ (NSMutableArray *) findByStore:(NSString *)store{
	PLSqliteDatabase *dataBase = [DataBase setup];
	
	id<PLResultSet> rs;
	rs = [dataBase executeQuery:[NSString stringWithFormat:@"SELECT * FROM Category where Store = %@",store]];
	
	//定义一个数组存放所有categpry的信息
	NSMutableArray *allCategory = [[NSMutableArray alloc] init];
	
	//把rs中的数据库信息遍历到books数组
	while ([rs next]) {
		NSString *ID = [rs objectForColumn:@"ID"];
		NSString *name = [rs objectForColumn:@"Name"];
		NSString *pic = [rs objectForColumn:@"Pic"];
        //    NSString *pic = @"123";
        NSString *store = [rs objectForColumn:@"Store"];
        
		//初始化book 存放到books里面
		dbCategory *category = [[dbCategory alloc] initWithID:ID name:name pic:pic store:store];
		[allCategory addObject:category];
        //		[Menu release];
	}
	//关闭数据库
	[rs close];
    return allCategory;
}
- (NSString *)name
{
    return _name;
}
- (NSString *)ID
{
    return  _id;
}
- (NSString *)pic
{
    return _pic;
}
- (NSString *)store
{
    return _stroe;
}
- (id) initWithID:(NSString *) ID name:(NSString *) name pic:(NSString *)pic store:(NSString *)store;{
    if (self = [super init]) {
        _id = ID;
        _name = name;
        _pic = pic;
        _stroe = store;
    }
    return self;
}

@end
