//
//  album.m
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/31/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import "album.h"
#import "DataBase.h"

@implementation album

+ (NSMutableArray *) findAll{
	PLSqliteDatabase *dataBase = [DataBase setup];
	
	id<PLResultSet> rs;
	rs = [dataBase executeQuery:@"SELECT * FROM ablums order by id desc"];
	
	//定义一个数组存放所有categpry的信息
	NSMutableArray *allAlbum = [[NSMutableArray alloc] init];
	
	//把rs中的数据库信息遍历到books数组
	while ([rs next]) {
		NSString *ID = [rs objectForColumn:@"id"];
		NSString *name = [rs objectForColumn:@"name"];
		NSString *pic = [rs objectForColumn:@"pic"];
        //    NSString *pic = @"123";
        NSString *user = [rs objectForColumn:@"user"];
        
		//初始化book 存放到books里面
		album *dbAlbum = [[album alloc] initWithID:ID name:name pic:pic user:user];
		[allAlbum addObject:dbAlbum];
        //		[Menu release];
	}
	//关闭数据库
	[rs close];
    return allAlbum;
}
- (id) initWithID:(NSString *) ID name:(NSString *) name pic:(NSString *)pic user:(NSString *)user
{
    _id = ID;
    _name = name;
    _pic = pic;
    _user = user;
    return self;
}
- (NSString *)name
{return _name;}
- (NSString *)ID
{return _id;}
- (NSString *)pic
{return _pic;}
- (NSString *)user
{return _user;}
+ (int) createWithID:(NSString *) ID name:(NSString *) name user:(NSString *)user pic:(NSString *)pic
{
    PLSqliteDatabase *dataBase = [DataBase setup];
    
    BOOL bResult = [dataBase executeUpdate: @"INSERT INTO ablums (id, name, user,pic) VALUES (null,?,?,?)",
                    name,
                    user,
                    pic];
	
	return bResult;
}
@end
