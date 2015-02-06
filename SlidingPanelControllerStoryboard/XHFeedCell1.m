//
//  XHFeedCell1.m
//  XHFeed
//
//  Created by 曾 宪华 on 13-12-12.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHFeedCell1.h"

@implementation XHFeedCell1

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _feedContainer = [[UIView alloc] initWithFrame:CGRectZero];
        _feedContainer.backgroundColor = [UIColor whiteColor];
        /*
         _feedContainer.layer.cornerRadius = 3.0f;
         _feedContainer.clipsToBounds = YES;
         _feedContainer.layer.shadowPath = [UIBezierPath bezierPathWithRect:_feedContainer.bounds].CGPath;
         */
        
        UIColor* mainColor = [UIColor colorWithRed:28.0/255 green:158.0/255 blue:121.0/255 alpha:1.0f];
        UIColor* neutralColor = [UIColor colorWithWhite:0.4 alpha:1.0];
        
        NSString* fontName = @"GillSans-Italic";
        NSString* boldFontName = @"GillSans-Bold";
        
        UIFont *nameLabelFont = [UIFont fontWithName:boldFontName size: 17.0f];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
        _nameLabel.textColor =  mainColor;
        _nameLabel.font = nameLabelFont;
        
        UIFont *updateLabelFont = [UIFont fontWithName:fontName size: 13.0f];
        
        _updateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _updateLabel.numberOfLines = 0;
        _updateLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _updateLabel.textAlignment = NSTextAlignmentLeft;
        _updateLabel.textColor =  neutralColor;
        _updateLabel.font = updateLabelFont;
        
        UIFont *dateLabelFont = [UIFont fontWithName:boldFontName size:12.0f];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        _dateLabel.textColor = neutralColor;
        _dateLabel.font = dateLabelFont;
        
        UIFont *countLabelFont = [UIFont fontWithName:fontName size:14.0f];
        
        _commentCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _commentCountLabel.textAlignment = NSTextAlignmentLeft;
        _commentCountLabel.textColor = neutralColor;
        _commentCountLabel.font = countLabelFont;
        
        _likeCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _likeCountLabel.textAlignment = NSTextAlignmentLeft;
        _likeCountLabel.textColor = mainColor;
        _likeCountLabel.font = countLabelFont;
        
        _picImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _picImageView.contentMode = UIViewContentModeScaleAspectFill;
        _picImageView.clipsToBounds = YES;
        
        _likeIconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        _commentIconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        
#define feedContainerX 20
#define feedContainerWidth 280
#define feedContainerHieght 338
        
#define nameLabelX 10
#define nameLabelY 223
#define nameLabelWidth 154
#define nameLabelHeight 21
#define updateLabelSepatorY 2
#define updateLabelWidth 263
#define updateLabelHeight 47
        
#define dateLabelSepatorX 37
#define dateLabelWidth 70
        
#define IconImageViewSize 12
#define IconImageViewSepatorY 13
        
#define commentCountLabelSepatorX 2
#define commentCountLabelSepatorY 8
#define commentCountLabelWidth 42
        
#define likeCountLabelSepatorX 2
        
#define picImageViewHeight 215
        
#define commentIconImageViewX 76
        
        _feedContainer.frame = CGRectMake(feedContainerX, feedContainerX, feedContainerWidth, feedContainerHieght);
        _nameLabel.frame = CGRectMake(nameLabelX, nameLabelY, nameLabelWidth, nameLabelHeight);
        _dateLabel.frame = CGRectMake(_nameLabel.frame.origin.x + _nameLabel.frame.size.width + dateLabelSepatorX, _nameLabel.frame.origin.y, dateLabelWidth, _nameLabel.frame.size.height);
        _updateLabel.frame = CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y + _nameLabel.frame.size.height + updateLabelSepatorY, updateLabelWidth, updateLabelHeight);
   /*     _commentIconImageView.frame = CGRectMake(_nameLabel.frame.origin.x, _updateLabel.frame.origin.y + _updateLabel.frame.size.height + IconImageViewSepatorY, IconImageViewSize, IconImageViewSize);
  
        _commentCountLabel.frame = CGRectMake(_commentIconImageView.frame.origin.x + _commentIconImageView.frame.size.width + commentCountLabelSepatorX, _updateLabel.frame.origin.y + _updateLabel.frame.size.height + commentCountLabelSepatorY, commentCountLabelWidth, _nameLabel.frame.size.height);
        
        _likeIconImageView.frame = CGRectMake(_commentCountLabel.frame.origin.x + _commentCountLabel.frame.size.width + likeCountLabelSepatorX, _commentIconImageView.frame.origin.y, _commentIconImageView.frame.size.width, _commentIconImageView.frame.size.height);*/
        
  //      _likeCountLabel.frame = CGRectMake(likeCountLabelSepatorX,_updateLabel.frame.origin.y + _updateLabel.frame.size.height + IconImageViewSepatorY, 100,100);
        _likeCountLabel.frame = CGRectMake(likeCountLabelSepatorX+7,260, 100,100);
        _picImageView.frame = CGRectMake(0, 0, _feedContainer.frame.size.width, picImageViewHeight);
        
        
        [_feedContainer addSubview:self.picImageView];
        [_feedContainer addSubview:self.nameLabel];
        [_feedContainer addSubview:self.dateLabel];
        [_feedContainer addSubview:self.updateLabel];
        [_feedContainer addSubview:self.likeCountLabel];
   //     [_feedContainer addSubview:self.likeIconImageView];
   //     [_feedContainer addSubview:self.commentCountLabel];
        [_feedContainer addSubview:self.commentIconImageView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.feedContainer];
    }
    return self;
}

- (void)setContentColor:(UIColor *)contentColor {
    _contentColor = contentColor;
    _nameLabel.textColor =  _contentColor;
    _updateLabel.textColor =  _contentColor;
    _dateLabel.textColor = _contentColor;
    _commentCountLabel.textColor = _contentColor;
    _likeCountLabel.textColor = _contentColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
