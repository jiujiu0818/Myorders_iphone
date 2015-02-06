//
//  DataBase.m
//  OrderManagement
//
//  Created by 金 秋瑞 on 3/26/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import "DataBase.h"
#import <PlausibleDatabase/PlausibleDatabase.h>

static PLSqliteDatabase * dbPointer;


@implementation DataBase

//单例

+ (PLSqliteDatabase *) setup{
	if (dbPointer) {
		return dbPointer;
	}
	
	NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES));
	NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	NSString *realPath = [documentPath stringByAppendingPathComponent:@"Menu.sqlite"];
	
	NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"Menu" ofType:@"sqlite"];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if (![fileManager fileExistsAtPath:realPath]) {
		NSError *error;
		if (![fileManager copyItemAtPath:sourcePath toPath:realPath error:&error]) {
			NSLog(@"%@",[error localizedDescription]);
		}
	}
	
	NSLog(@"复制sqlite到路径：%@成功。",realPath);
	
	//把dbpointer地址修改为可修改的realPath。
	dbPointer = [[PLSqliteDatabase alloc] initWithPath:realPath];
	
	[dbPointer open];
	
	return dbPointer;
}

+ (void) close{
	if (dbPointer) {
		[dbPointer close];
		dbPointer = NULL;
	}
}
@end