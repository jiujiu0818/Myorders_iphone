//
//  DAPhotoWallViewController.h
//  DoubanAlbum
//
//  Created by Tonny on 12-12-11.
//  Copyright (c) 2012年 SlowsLab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterF.h"

@interface DAPhotoWallViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIActionSheetDelegate>{
}

//@property (nonatomic) CGFloat paperIndicatorOffset;
@property (nonatomic,strong) WaterF* waterfall;
@property (nonatomic,strong) NSMutableArray* images;
@property (nonatomic,strong) NSArray* texts;
@property int row;
@property (strong,nonatomic) NSArray *nameTexts;
@property (strong,nonatomic) NSArray *userTexts;

@end
