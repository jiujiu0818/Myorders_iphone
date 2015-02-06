//
//  DAPhotoWallViewController.m
//  DoubanAlbum
//
//  Created by Tonny on 12-12-11.
//  Copyright (c) 2012年 SlowsLab. All rights reserved.
//

#import "DAPhotoWallViewController.h"
#import <QuartzCore/QuartzCore.h>

//#import "DAWaterfallLayout.h"
#import "WaterF.h"
#import "DAUserAblumsViewController.h"
#import "UIView+Additon.m"
#import "UIViewController+DoubanAlbum.h"
#import "DoubanAlbumDefines.h"
#import "album.h"

#define CELL_COUNT 8

@interface DAPhotoWallViewController ()
@property (nonatomic, strong) NSMutableArray *cellSizes;

@end

@implementation DAPhotoWallViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tb_bg_album-568h.jpg"]];
    
    [self setBarButtonItems];
    
    self.userTexts = @[@"Coloful Dessert",@"I Love Coffe",@"Hey! fruits",@"Sushi sushi",@"Chinese Tea",@"Pasta:))",@"Oh my tea",@"Pizzzzzzzzza"];
    self.nameTexts = @[@"Rachel",@"Jack",@"Micheal",@"Jordan",@"Joey",@"Monica",@"Jenny",@"Sheldon"];
    
    self.texts = @[
                   @"1234",
                   @"The red lines indicate horizontal alignment. Most elements on the screen are not precisely aligned to any other element, resulting in an unhealthy number of lines. What makes matters worse is that the lines don’t seem to have any consistent pattern or equal spacing.",
                   @"Developers are often very concerned about using the screen as efficiently as possible and filling up every pixel of the screen with stuff. While this might be efficient, it also generates a confusing mess because whitespace — the space on the screen without stuff — is your most powerful tool for organizing elements into logical sections, helping your user to effortlessly make sense of the content.",
                   @"Sans serif fonts like Helvetica Neue, Apple’s preferred font in iOS 7, don’t have embellishments on letters; they look cleaner and lend themselves well to smaller pieces of text such as headings and controls.",
                   @"Notice how the Status Bar is always blended with the Navigation Bar; always strive to blend these two elements together in a tasteful way.",
                   @"Apple tends to make the chrome in their iOS 7 apps the same color as the app’s primary background in an attempt to make the chrome disappear. This may work in some cases but keep in mind that doing this could very well have the opposite effect because it causes the chrome to visually blend with the content, making it harder distinguish the two. When chrome and content look the same, they both look equally as important – defeating the purpose of hiding the chrome. In other words, a contrasting background for chrome may not always be a bad thing.",
                   @"Hide the chrome when possible",
                   @"The borders Apple uses in iOS 7 tend to be thin but distinct. Apple’s buttons generally use transparent backgrounds for their unselected state and simple colored backgrounds for their selected state. Experiment with things such as border weight, background color, transparency, the radius of the rounded corners, or subtle shadows and textures when seeking a unique button style for your app.",
                   @"Make content king",
                   @"Use the whole screen",
                   @"So how do you stand out on iOS 7? How do you create a delightful personality without mind-blowing graphics? In short, app design in the new paradigm will be less about how your app looks and a lot more about how it works and feels. I think the de-emphasis of visuals in iOS 7 will generate a renaissance of innovation in touch interaction design.",
                   @"What a shame it would have been for Apple to nail 1:1 scrolling but not follow through with the inertia and bounciness you have come to know and love. Direct manipulation goes hand in hand with physics and animation; the goal is to make the interactions feel real.",
                   @"3D Effects",
                   @"Tilt your iPhone and you will see that the icons are not actually sitting on the background — the parallax effect reveals they’re floating above it instead. Bring up Control Center and the frosted glass makes it very apparent that Control Center is a layer above all the icons. Think about your interface in layers and use 3D effects to make the purpose of the layers clear to your user.",
                   @"Gestures and navigation",
                   @"However, soiven UI.",
                   @"Adding gravity",
                   @"However, there’s still something not quite right with the interaction between the two objects. The barrier is supposed to be immovable, but when the two objects collide in your current configuration the barrier is knocked out of place and starts spinning towards the bottom of the screen.Even more oddly, the barrier bounces off the bottom of the screen and doesn’t quite settle down like the square – this makes sense because the gravity behavior doesn’t interact with the barrier. This also explains why the barrier doesn’t move until the square collides with it.Looks like you need a different approach to the problem. Since the barrier view is immovable, there isn’t any need to for the dynamics engine to be aware of its existence. But how will the collision be detected?"
                   ];
    
    //   NSMutableArray* URLS = [[NSMutableArray alloc]initWithCapacity:30];
    /*    for (int i = 0; i<urls.count; i++)
     {
     [URLS addObject:[NSURL URLWithString:urls[i]]];
     }
     self.images = [[NSMutableArray alloc]initWithCapacity:30];*/
    self.images = [[NSMutableArray alloc]initWithCapacity:10];
    for (int i = 1; i<6; i++)
    {
        //        NSData* data = [[NSData alloc]initWithContentsOfURL:URLS[i]];
        //   [self.images addObject:[UIImage imageWithData:data]];
        [self.images addObject:[UIImage imageNamed:[NSString stringWithFormat: @"%d.jpg",i]]];
    }
    NSLog(@"%d",[self.images count]);
    /* SEL addCView = @selector(addWaterFollow:);
     UIButton* collectionViewAdd = [UIButton buttonWithType:UIButtonTypeSystem];
     collectionViewAdd.frame = CGRectMake(50, 120, 100, 40);
     [collectionViewAdd setTitle:@"CollectionBtn" forState:UIControlStateNormal];
     [collectionViewAdd addTarget:self action:addCView forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:collectionViewAdd];*/
    
    WaterFLayout* flowLayout = [[WaterFLayout alloc]init];
    self.waterfall = [[WaterF alloc]initWithCollectionViewLayout:flowLayout];
    self.waterfall.imagesArr = self.images;
    self.waterfall.textsArr = self.texts;
    self.waterfall.sectionNum = 1;
    self.waterfall.imagewidth = 150;
    self.waterfall.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tb_bg_album-568h.jpg"]];
    [self.view addSubview:self.waterfall.view];

}



- (void)setBarButtonItems{
    [self setBackLeftBarButtonItem];
    
        UIImage *backImg1 = [UIImage imageNamed:@"btn_peo.png"];
        UIImage *backImgTapped1 = [UIImage imageNamed:@"btn_peo_tapped.png"];
        
        UIButton *profileBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        profileBtn.frame = CGRectMake(0, 0, 44, 44);
        [profileBtn addTarget:self action:@selector(doRight:) forControlEvents:UIControlEventTouchUpInside];
        //    profileBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 10);
        
        [profileBtn setImage:backImg1 forState:UIControlStateNormal];
        [profileBtn setImage:backImgTapped1 forState:UIControlStateHighlighted];
        
        UIBarButtonItem *profileItem = [[UIBarButtonItem alloc] initWithCustomView:profileBtn];
                
        self.navigationItem.rightBarButtonItem = profileItem;
    
    //////
    CGFloat width = (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)?206:APP_SCREEN_HEIGHT-20-114);
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, UIInterfaceOrientationIsPortrait(self.interfaceOrientation)?44:32)];//206 is max width //258
//    titleView.backgroundColor = [UIColor grayColor];
    titleView.backgroundColor = [UIColor clearColor];
    
//    NSArray *albumIds = [[DADataEnvironment sharedDADataEnvironment].collectedAlbums valueForKeyPath:Key_Album_Id];
    
    UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(width-99, 0, 44, titleView.height);
    collectBtn.tag = 1;
    
    [collectBtn addTarget:self action:@selector(doCollect:) forControlEvents:UIControlEventTouchUpInside];
    
 
        [collectBtn setImage:[UIImage imageNamed:@"btn_collect.png"] forState:UIControlStateNormal];
        [collectBtn setImage:[UIImage imageNamed:@"btn_collect_tapped.png"] forState:UIControlStateHighlighted];
    
    [titleView addSubview:collectBtn];
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.tag = 2;
    shareBtn.frame = CGRectMake(width-44, 0, 44, titleView.height);
    [shareBtn addTarget:self action:@selector(doShare:) forControlEvents:UIControlEventTouchUpInside];
    
    [shareBtn setImage:[UIImage imageNamed:@"btn_share.png"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"btn_share_tapped.png"] forState:UIControlStateHighlighted];
    
    [titleView addSubview:shareBtn];
    
    self.navigationItem.titleView = titleView;
}

- (void)doRight:(UIButton *)button{
    DAUserAblumsViewController *vc = (DAUserAblumsViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"DAUserAblumsViewController"];

    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
//    NSUInteger count = [self countOfAlbumTitleAndDescribe]+[_dataSource count];
   return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    

//    NSUInteger item = indexPath.item;
    NSInteger row = indexPath.row;
   //     NSLog(@"%ld",(long)row);
    UICollectionViewCell *cell = nil;
//    NSUInteger albumAndDesCount = [self countOfAlbumTitleAndDescribe];
 
        static NSString *CellIdentifier = @"ImageCellIdentifier";
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
/*    CHTCollectionViewWaterfallCell *cell =
    (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCellIdentifier"
                                       
                                                                                forIndexPath:indexPath];

        UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:1];
        
        [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"default_album%lu.png",(unsigned long)row]]];
   // cell.displayString = [NSString stringWithFormat:@"%ld", (long)indexPath.item];
    return cell;
}*/


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}

- (IBAction)swipeBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)swipeUserAlbums:(id)sender {
    
}



- (void)doCollect:(UIButton *)button{
  //  NSLog(@"123");
    [album createWithID:@"1000" name:self.nameTexts[self.row] user:self.userTexts[self.row] pic:[NSString stringWithFormat:@"default_album%d.png",self.row]];
    
    NSString *msg = [NSString stringWithFormat:@"Do you really like this?"];
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:msg
                                  delegate:(id)self
                                  cancelButtonTitle:@"NO"
                                  destructiveButtonTitle:@"YES"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}


- (void)doShare:(UIButton *)button{
   }

#pragma mark - UIViewControllerRotation

/*
- (void)adjustToInterface:(UIInterfaceOrientation)toInterfaceOrientation{
    _interfaceWhenDisappear = toInterfaceOrientation;
    
    [self setBarButtonItems];
    
    DAWaterfallLayout *layout = (DAWaterfallLayout *)_collectionView.collectionViewLayout;
    [layout clearLayoutAttributes];
    
    [_collectionView reloadData];
}
*/


@end
