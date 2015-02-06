//
//  BIDViewController.m
//  CellTest
//
//  Created by 金 秋瑞 on 4/28/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import "BIDViewController.h"
#import "SingleSample.h"
#import "Menu.h"
#import "sqlite3.h"
#import "BIDMyDishesController.h"
#import "RatingView.h"

@interface BIDViewController ()
@end

@implementation BIDViewController
@synthesize categoryID;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    allMenu = [Menu findByCategory:self.categoryID];
    
    myTable = [[HVTableView alloc] initWithFrame:CGRectMake(0, 20, 350, 568) expandOnlyOneCell:NO enableAutoScroll:YES];
    myTable.HVTableViewDelegate = self;
    myTable.HVTableViewDataSource = self;
    [myTable reloadData];
    [self.view addSubview:myTable];
    		cellTitles = @[@"Twitowie", @"Bill Greyskull", @"Moonglampers", @"Psit", @"Duncan WJ Palmer", @"Sajuma", @"Victor_lee", @"Jugger-naut", @"Javiersanagustin", @"Velouria!"];
    
    [myTable setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint* myTableWidthCon = [NSLayoutConstraint constraintWithItem:myTable attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:350];
    NSLayoutConstraint* myTableBottomCon = [NSLayoutConstraint constraintWithItem:myTable attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    NSLayoutConstraint* myTableCenterXCon = [NSLayoutConstraint constraintWithItem:myTable attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint* myTableTopCon = [NSLayoutConstraint constraintWithItem:myTable attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:+65
                                         ];
    [self.view addConstraints:@[myTableBottomCon, myTableCenterXCon, myTableWidthCon, myTableTopCon]];
    
}

-(void)tableView:(UITableView *)tableView expandCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{ Menu *menu = [allMenu objectAtIndex:indexPath.row];
            [self.ratingView removeFromSuperview];
    [self.labelPrice removeFromSuperview];
	[[cell.contentView viewWithTag:10] removeFromSuperview];
	UIButton* purchaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//	purchaseButton.frame = CGRectMake(600, 150, 120, 40);
    purchaseButton.frame = CGRectMake(-120, 0, 130, 40);
	purchaseButton.alpha = 0;
	[purchaseButton setTitle:@"Order!" forState:UIControlStateNormal];
	purchaseButton.titleLabel.font = [UIFont fontWithName:@"Party LET" size:40];
	purchaseButton.backgroundColor = [UIColor lightTextColor];
//        [purchaseButton setBackgroundImage:[UIImage imageNamed:@"banner.png"] forState:UIControlStateNormal];
//	[purchaseButton setTintColor:[UIColor whiteColor]];
    [purchaseButton setTintColor:self.navigationController.navigationBar.tintColor];
    purchaseButton.alpha = 0.2;
    [purchaseButton addTarget:self action:@selector(orderButton:) forControlEvents:UIControlEventTouchUpInside];
	[cell.contentView addSubview:purchaseButton];
	purchaseButton.tag = indexPath.row;
	
	[UIView animateWithDuration:.5 animations:^{
		cell.detailTextLabel.text = [menu intro];
//		purchaseButton.frame = CGRectMake(450, 150, 120, 40);
        purchaseButton.frame = CGRectMake(0, 0, 130, 40);
		purchaseButton.alpha = 1;
		[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(3.14);
	}];
}

-(void)tableView:(UITableView *)tableView collapseCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
	[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(0);
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
    NSLog(@"%lu",(unsigned long)[allMenu count]);
    return [allMenu count];
 //   return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath isExpanded:(BOOL)isexpanded
{
	//you can define different heights for each cell. (then you probably have to calculate the height or e.g. read pre-calculated heights from an array
	if (isexpanded)
		return 110;
	
	return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath isExpanded:(BOOL)isExpanded
{
 //   NSLog(@"123");
        Menu *menu = [allMenu objectAtIndex:indexPath.row];
	static NSString *CellIdentifier = @"aCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIImageView* expandGlyph = [[UIImageView alloc] initWithFrame:CGRectMake(310, 5, 15, 10)];
		expandGlyph.image = [UIImage imageNamed:@"expandGlyph.png"];
		expandGlyph.tag = 7;
		[cell.contentView addSubview:expandGlyph];
		cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
		cell.detailTextLabel.numberOfLines = 0;
	}
	//alternative background colors for better division ;)
	if (indexPath.row %2 ==1)
		cell.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1];
	else
		cell.backgroundColor = [UIColor colorWithRed:.8 green:.8 blue:.8 alpha:1];
	
	
	cell.textLabel.text =[NSString stringWithFormat:@"%@",[menu name]];
    //[cellTitles objectAtIndex:indexPath.row % 10 ];
//    NSLog([menu pic]);
	cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[menu pic]]];
    
    self.labelPrice = [[UILabel alloc] initWithFrame:CGRectMake(270, 45, 40, 20)];
    self.labelPrice.text = [NSString stringWithFormat:@"$%@",[menu price]];
    [cell addSubview:self.labelPrice];
    
    
    self.ratingView = [[RatingView alloc] initWithFrame:CGRectMake(130, 45, 150, 150)];
    [self.ratingView setImagesDeselected:@"0.png" partlySelected:@"1.png" fullSelected:@"2.png" andDelegate:self];
//    [[cell.contentView viewWithTag:11] addSubview:ratingView];
    [cell addSubview:self.ratingView];
    int a = [[menu allScore] intValue];
    float b= [[menu scoreCount] floatValue];
        [self.ratingView displayRating:a/b];
	
	if (!isExpanded) //prepare the cell as if it was collapsed! (without any animation!)
	{
//		cell.detailTextLabel.text = [menu name];
        //@"Lorem ipsum dolor sit amet";
	//	[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(0);
	}
	else ///prepare the cell as if it was expanded! (without any animation!)
	{
		cell.detailTextLabel.text = [menu intro];
		[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(3.14);
		
		[[cell.contentView viewWithTag:10] removeFromSuperview];
		UIButton* purchaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		purchaseButton.frame = CGRectMake(-120, 0, 60, 30);
		[purchaseButton setTitle:@"Order!!!" forState:UIControlStateNormal];
		purchaseButton.titleLabel.font = [UIFont fontWithName:@"Party-LET" size:10];
		purchaseButton.backgroundColor =[UIColor colorWithRed:46.0f/255.0f green:87.0f/255.0f blue:29.0f/255.0f alpha:1.0f];
		[purchaseButton setTintColor:self.navigationController.navigationBar.tintColor];
		[cell.contentView addSubview:purchaseButton];
		purchaseButton.tag = 10;
//		[[cell.contentView viewWithTag:11] removeFromSuperview];
	}
	return cell;
}


//穿参的问题需要解决。。。先放在这里吧
-(IBAction)orderButton:(id)sender
{
    NSInteger row = [sender tag];
    NSLog(@"%ld",(long)row);
    Menu *menu = allMenu[row];
    [[SingleSample sharedSingleSample].myOrder addObject:menu];
//    NSLog(@"name %@",[[SingleSample sharedSingleSample].myOrder[0] name]);
    NSLog(@"NAME %@",menu.name);
    NSString *msg = [NSString stringWithFormat:@"Are you sure to order %@ ?",menu.name];
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:msg
                                  delegate:(id)self
                                  cancelButtonTitle:@"NO"
                                  destructiveButtonTitle:@"YES"
                                  otherButtonTitles:nil];
    [actionSheet showInView:self.view];
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

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
