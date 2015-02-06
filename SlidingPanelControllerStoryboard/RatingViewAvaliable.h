//
//  RatingViewAvaliable.h
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/6/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol RatingViewDelegate
-(void)ratingChanged:(float)newRating;
@end

@interface RatingViewAvaliable :UIView {
	UIImageView *s1, *s2, *s3, *s4, *s5;
	UIImage *unselectedImage, *partlySelectedImage, *fullySelectedImage;
	id<RatingViewDelegate> viewDelegate;
    
	float starRating, lastRating;
	float height, width; // of each image of the star!
}

@property (nonatomic, retain) UIImageView *s1;
@property (nonatomic, retain) UIImageView *s2;
@property (nonatomic, retain) UIImageView *s3;
@property (nonatomic, retain) UIImageView *s4;
@property (nonatomic, retain) UIImageView *s5;

-(void)setImagesDeselected:(NSString *)unselectedImage partlySelected:(NSString *)partlySelectedImage
			  fullSelected:(NSString *)fullSelectedImage andDelegate:(id<RatingViewDelegate>)d;
-(void)displayRating:(float)rating;
-(float)rating;

@end
