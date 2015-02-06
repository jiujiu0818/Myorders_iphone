//
//  Menu.m
//  OrderManagement
//
//  Created by 金 秋瑞 on 3/26/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import "Menu.h"
#import "DataBase.h"

@implementation Menu

+ (NSMutableArray *) findAll{
	PLSqliteDatabase *dataBase = [DataBase setup];
	
	id<PLResultSet> rs;
	rs = [dataBase executeQuery:@"SELECT * FROM Menu"];
	
	//定义一个数组存放所有菜品的信息
	NSMutableArray *allMenu = [[NSMutableArray alloc] init];
	
	//把rs中的数据库信息遍历到数组
	while ([rs next]) {
		NSString *ID = [rs objectForColumn:@"ID"];
		NSString *name = [rs objectForColumn:@"name"];
		NSString *price = [rs objectForColumn:@"price"];
        NSString *pic = [rs objectForColumn:@"Pic"];
        NSString *intro = [rs objectForColumn:@"Intro"];
        NSString *categoryID = [rs objectForColumn:@"categoryID"];
        NSNumber *scoreCount = [rs objectForColumn:@"scoreCount"];
        NSNumber *allScore = [rs objectForColumn:@"allScore"];
        
        		
		//初始化menu 存放到allmenu里面
		Menu *menu = [[Menu alloc] initWithID:ID name:name price:price pic:pic intro:intro categoryID:categoryID scoreCount:scoreCount allSocre:allScore];
		[allMenu addObject:menu];
//		[Menu release];
	}
	//关闭数据库
	[rs close];
	
	return allMenu;
}
+ (NSMutableArray *) findByCategory:(NSString *)categoryID{
    PLSqliteDatabase *dataBase = [DataBase setup];
	
	id<PLResultSet> rs;
	rs = [dataBase executeQuery:[NSString stringWithFormat:@"SELECT * FROM Menu where categoryID = %@",categoryID]];
	
	//定义一个数组存放所有书籍的信息
	NSMutableArray *allMenu = [[NSMutableArray alloc] init];
	
	//把rs中的数据库信息遍历到books数组
	while ([rs next]) {
		NSString *ID = [rs objectForColumn:@"ID"];
		NSString *name = [rs objectForColumn:@"name"];
		NSString *price = [rs objectForColumn:@"price"];
        NSString *pic = [rs objectForColumn:@"Pic"];
        NSString *intro = [rs objectForColumn:@"Intro"];
        NSString *categoryID = [rs objectForColumn:@"categoryID"];
        NSNumber *scoreCount = [rs objectForColumn:@"scoreCount"];
        NSNumber *allScore = [rs objectForColumn:@"allScore"];
        
        
		//初始化book 存放到books里面
		Menu *menu = [[Menu alloc] initWithID:ID name:name price:price pic:pic intro:intro categoryID:categoryID scoreCount:scoreCount allSocre:allScore];
		[allMenu addObject:menu];
        //		[Menu release];
	}
	//关闭数据库
	[rs close];
	
	return allMenu;
}
- (id) initWithID:(NSString *) ID name:(NSString *) name price:(NSString *)price pic:(NSString *) pic intro:(NSString *) intro categoryID: (NSString *) categoryID scoreCount:(NSNumber *)scoreCount allSocre:(NSNumber *)allScore {
 //   _id = [ID retain];
 //   _name = [name retain];
 //   _price = [price retain];
    _id = ID;
    _name = name;
    _price = price;
    _pic = pic;
    _intro = intro;
    _categoryID = categoryID;
    _scoreCount = scoreCount;
    _allScore = allScore;
return self;
}

+ (int) createWithID:(NSString *) ID name:(NSString *) name price:(NSString *)price
{
	PLSqliteDatabase *dataBase = [DataBase setup];
    
    BOOL bResult = [dataBase executeUpdate: @"INSERT INTO Menu (ID, Name, Price) VALUES (?,?,?)",
                    ID,
                    name,
                    price];
	
	return bResult;
}

+ (int) delete:(NSString *) ID
{
	PLSqliteDatabase *dataBase = [DataBase setup];
	
	BOOL bResult = [dataBase executeUpdate:@"DELETE FROM Menu WHERE ID = ?",
					ID];
	
	return bResult;
}

- (NSString *) ID{
    return _id;
}

- (NSString *) name{
	return _name;
}

- (NSString *) price{
	return _price;
}
- (NSString *) intro
{
    return _intro;
}
-(NSString *)pic
{
    return _pic;
}
- (NSString *) categoryID
{
    return _categoryID;
}
- (NSNumber *) scoreCount
{
    return _scoreCount;
}
- (NSNumber *) allScore
{
    return _allScore;
}
@end
