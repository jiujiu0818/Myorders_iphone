//
//  storeRankController.m
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/22/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import "storeRankController.h"
#import "orderController.h"

@interface storeRankController ()

@end

@implementation storeRankController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.storeName = @[@"The Noodle House",
                      @"Sushi Store",
                      @"Wine Bar",
                      @"Chinses Food Store",
                      @"ALL"];
    self.storePoints =@[@"4.9Points",
                        @"4.5Points",
                        @"4.0Points",
                        @"3.6Points",
                        @"3.5Points"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showMenu)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"storeRank" forIndexPath:indexPath];
    
    // Configure the cell...
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];
    view.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview:view];
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"store%ld.png",(long)indexPath.row]]];
    UILabel *cellLabel1 = (UILabel *)[cell viewWithTag:1];
    cellLabel1.text =[NSString stringWithFormat:@"Rank #%ld",(long)indexPath.row+1];
    UILabel *cellLabel2 = (UILabel *)[cell viewWithTag:2];
    cellLabel2.text = self.storePoints[indexPath.row];
    //@"4.5points";
    
    UILabel *cellLabel3 = (UILabel *)[cell viewWithTag:3];
    cellLabel3.text = self.storeName[indexPath.row];
    //@"Sushi Store";
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

       UINavigationController *navigationController =segue.destinationViewController;
     UIViewController *controller;
     if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
     UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
     controller = [navController.viewControllers objectAtIndex:0];
     } else {
     controller = segue.destinationViewController;
     }
     
     if ([controller isKindOfClass:[orderController class]]) {
     orderController *categoryController = (orderController *)controller;
     NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
     //[detailController setDataString:[NSString stringWithFormat:@"%i",selectIndexPath.section]];
     categoryController.storeID = [NSString stringWithFormat:@"%d",indexPath.row];
         NSLog(@"??%@",categoryController.storeID);
     }
}
- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
