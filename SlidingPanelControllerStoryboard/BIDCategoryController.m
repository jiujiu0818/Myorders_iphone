//
//  BIDCategoryController.m
//  MyOrders
//
//  Created by 金 秋瑞 on 3/7/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import "BIDCategoryController.h"
#import "dbCategory.h"
#import "sqlite3.h"
#import "BIDViewController.h"
#import "SingleSample.h"
@interface BIDCategoryController ()

@end

@implementation BIDCategoryController

- (IBAction)showMenu
{
    NSLog(@"123");
    [self.frostedViewController presentMenuViewController];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showMenu)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
   // allCategory = [dbCategory findAll];
    if ([SingleSample sharedSingleSample].storeID) {
        self.storeID = [SingleSample sharedSingleSample].storeID;
    }
    else self.storeID = @"1";
        // [[SingleSample sharedSingleSample].myOrder count];
    //    NSLog(@"!!!%@",self.storeID);
   // [SingleSample sharedSingleSample].storeID = self.storeID;
    allCategory = [dbCategory findByStore:self.storeID];

    
	// Do any additional setup after loading the view.
    self.category = @[@"Hotdog",
    @"Pizza",
    @"Drink",
    @"Dessert",
    @"ALL"]; 
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"a.png"] forBarMetrics:UIBarMetricsDefault];
//    UIColor *color = [UIColor whiteColor];
//    self.navigationController.navigationBar.tintColor = color;
    
    int length = 4;
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i = 0 ; i < length; i++)
    {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"title%d",i],@"title" ,nil];
        [tempArray addObject:dict];
    }
    
    NSMutableArray *itemArray = [NSMutableArray arrayWithCapacity:length+2];
    if (length > 1)
    {
        NSDictionary *dict = [tempArray objectAtIndex:length-1];
        SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithDict:dict tag:-1];
        [itemArray addObject:item];
    }
    for (int i = 0; i < length; i++)
    {
        NSDictionary *dict = [tempArray objectAtIndex:i];
        SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithDict:dict tag:i];
        [itemArray addObject:item];
        
    }
    //添加第一张图 用于循环
    if (length >1)
    {
        NSDictionary *dict = [tempArray objectAtIndex:0];
        SGFocusImageItem *item = [[SGFocusImageItem alloc] initWithDict:dict tag:length];
        [itemArray addObject:item];
    }
    SGFocusImageFrame *bannerView = [[SGFocusImageFrame alloc] initWithFrame:CGRectMake(0, 0+65, 320, 150) delegate:self imageItems:itemArray isAuto:NO];
    [bannerView scrollToIndex:2];
    [self.view addSubview:bannerView];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    


}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.tableView.frame = CGRectMake(0, 65+85, 320, self.view.frame.size.height-150-60);
    [self.tableView layoutSubviews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UICollectionViewCell *cell = [cv dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSUInteger row = indexPath.row;
    dbCategory *category = [allCategory objectAtIndex:indexPath.row];
    UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:1];
    UILabel *nameLbl = (UILabel *)[cell.contentView viewWithTag:2];
    
    [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[category pic]]]];
    nameLbl.text = [category name];
    /*   NSDictionary *dic = _dataSource[row];
     
     NSString *cover = dic[Key_Album_Cover];
     NSString *url = nil;
     if (![cover hasPrefix:@"http://"]) {
     url = [NSString stringWithFormat:@"http://%@", cover];
     }else{
     url = cover;
     }
     
     NSURL *URL = [NSURL URLWithString:url];
     [imgView setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"default_album.png"]];
     
     nameLbl.text = dic[Key_Album_Name];
     
     SLLog(@"dic %@", dic);*/
    return cell;
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return [allCategory count];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UINavigationController *navigationController =segue.destinationViewController;
    
 //   BIDViewController *menuController =[[navigationController viewControllers] objectAtIndex:0];
    
 //   menuController.delegate = self;
    
 //   NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];
    
//    dbCategory *category= [allCategory objectAtIndex:indexPath.row];
//    NSString *categoryID = [category ID];
//    menuController.categoryID = categoryID;
    UIViewController *controller;
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
        controller = [navController.viewControllers objectAtIndex:0];
    } else {
        controller = segue.destinationViewController;
    }
    
    if ([controller isKindOfClass:[BIDViewController class]]) {
        BIDViewController *menuController = (BIDViewController *)controller;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        //[detailController setDataString:[NSString stringWithFormat:@"%i",selectIndexPath.section]];
            dbCategory *category= [allCategory objectAtIndex:indexPath.row];
            NSString *categoryID = [category ID];
        menuController.categoryID = categoryID;
        
    }
}


@end
