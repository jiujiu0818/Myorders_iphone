//
//  DAHomeViewController.m
//  DoubanAlbum
//
//  Created by Tonny on 12-12-8.
//  Copyright (c) 2012年 SlowsLab. All rights reserved.
//

#import "DAHomeViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DAImageResizedImageView.h"
#import "REFrostedViewController.h"
#import "DAPhotoWallViewController.h"


typedef enum {
    kTagCategoryView = 100,
    kTagHeaderView,
    kTagTitleView,
    kTagTitleLbl,
    kTagTitleIndiImgView,
    kTagShadowView,
}kDATableViewControllerTags;

static BOOL IsShowingCategory = NO;

@interface DAHomeViewController ()

@end

@implementation DAHomeViewController

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    if (self) {
//        self.navigationController.navigationBarHidden = YES;
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.userTexts = @[@"Coloful Dessert",@"I Love Coffe",@"Hey! fruits",@"Sushi sushi",@"Chinese Tea",@"Pasta:))",@"Oh my tea",@"Pizzzzzzzzza"];
    self.nameTexts = @[@"Rachel",@"Jack",@"Micheal",@"Jordan",@"Joey",@"Monica",@"Jenny",@"Sheldon"];
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:_tableView.bounds];
    bgImgView.autoresizesSubviews = UIViewAutoresizingFlexibleWidth;
    bgImgView.image = [UIImage imageNamed:@"tb_bg_album-568h.jpg"];
    _tableView.backgroundView = bgImgView;
    
    
    UIImage *topBarImg = [UIImage imageNamed:@"bg_nav.png"];
    
//    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:TEXT_COLOR_2, UITextAttributeTextColor, RGBCOLOR(255, 215, 150), UITextAttributeTextShadowColor, [NSValue valueWithCGSize:CGSizeMake(1, 1)], UITextAttributeTextShadowOffset, [UIFont boldSystemFontOfSize:18], UITextAttributeFont, nil];
    [self.navigationController.navigationBar setBackgroundImage:topBarImg forBarMetrics:UIBarMetricsDefault];
    
    [self setBarButtonItems];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}



- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //hidePaperIndicator
    [self hidePaperIndicator];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSUInteger row = indexPath.row;
    
    UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:1];
//    [imgView setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"default_album.png"]];
   // imgView = [UIImage imageNamed:@"default_album.png"];
    [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"default_album%lu.png",(unsigned long)row]]];
    NSLog([NSString stringWithFormat:@"default_album%lu.png",(unsigned long)row]);
    
    UILabel *titleLbl = (UILabel *)[cell.contentView viewWithTag:2];
    titleLbl.text = self.userTexts[indexPath.row];
    
    UILabel *userNameLbl = (UILabel *)[cell.contentView viewWithTag:3];
    NSString *userName = self.nameTexts[indexPath.row];
    if (userName) {
        userNameLbl.text = [NSString stringWithFormat:@"%@  %@", NSLocalizedString(@"来自", nil), userName];
    }else{
        userNameLbl.text = nil;
    }
    
    return cell;
}

#pragma mark - Table view delegate

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 25.0;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSDictionary *dic = _dataSource[section];
//    return dic[@"category"];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSUInteger row = indexPath.row;
//    [DAHttpClient photosInAlbumWithId:[dic[@"album_id"] integerValue]
//                                start:0
//                              success:^(NSArray *array) {
//                                  
//                              } error:^(NSInteger index) {
//
//                              } failure:^(NSError *error) {
//                                  
//                              }];
    
//    DAPhotosWallViewController *wallVC = [[DAPhotosWallViewController alloc] initWithCollectionViewLayout:layout];
//    [self.navigationController pushViewController:wallVC animated:YES];
}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if (IsShowingCategory) {
//        [self showOrHideCategory:nil];
//    }
//}

- (void)setBarButtonItems{
    _refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _refreshBtn.frame = CGRectMake(0, 0, 44, 44);
    [_refreshBtn addTarget:self action:@selector(doRefresh:) forControlEvents:UIControlEventTouchUpInside];
    
    [_refreshBtn setImage:[UIImage imageNamed:@"btn_update.png"] forState:UIControlStateNormal];
    [_refreshBtn setImage:[UIImage imageNamed:@"btn_update_tapped.png"] forState:UIControlStateHighlighted];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_refreshBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
    ///////

}


- (void)doRefresh:(UIButton *)button{
    [self startAnimation:button];
    
//    NSString *file = [[NSBundle mainBundle] pathForResource:@"albums" ofType:@"plist"];
//    SLLog(@"json %@", [[NSDictionary dictionaryWithContentsOfFile:file] JSONString]);
    [self stopAnimation];
    //刷新控件显示2秒如何做

}

- (void)startAnimation:(UIButton *)button{
    button.userInteractionEnabled = NO;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: 0-M_PI * 2.0 ];///* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = 1;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = CGFLOAT_MAX;
    
    [button.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopAnimation{
    _refreshBtn.userInteractionEnabled = YES;
    [_refreshBtn.layer removeAllAnimations];
}



#pragma mark - To PhotoWall ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *navigationController =segue.destinationViewController;
    UIViewController *controller;
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        controller = [navController.viewControllers objectAtIndex:0];
    } else {
        controller = segue.destinationViewController;
    }
    
    if ([controller isKindOfClass:[DAPhotoWallViewController class]]) {
        DAPhotoWallViewController *photoWallController = (DAPhotoWallViewController *)controller;
        NSIndexPath *indexPath = [self->_tableView indexPathForCell:sender];
        //[detailController setDataString:[NSString stringWithFormat:@"%i",selectIndexPath.section]];
      //  dbMap *location= [allLocation objectAtIndex:indexPath.row];
      //  mapIntroController.location = location;
        photoWallController.row = indexPath.row;
    }
  
}


- (void)hidePaperIndicator{
    UITableViewCell *lastSeletedSell = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_lastSelectedRow inSection:0]];
    UIView *view0 = [lastSeletedSell.contentView viewWithTag:4];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         view0.alpha = 0;
                     }];
}

@end
