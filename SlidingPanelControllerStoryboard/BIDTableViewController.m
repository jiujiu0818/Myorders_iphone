//
//  BIDTableViewController.m
//  CellTest
//
//  Created by 金 秋瑞 on 4/28/14.
//  Copyright (c) 2014 Rachel. All rights reserved.
//

#import "BIDTableViewController.h"

@interface BIDTableViewController ()

@end

@implementation BIDTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    			HVTableView* myTable = [[HVTableView alloc] initWithFrame:CGRectMake(84, 250, 600, 600) expandOnlyOneCell:NO enableAutoScroll:YES];
    			myTable.HVTableViewDelegate = self;
    			myTable.HVTableViewDataSource = self;
    			[myTable reloadData];
    			[self.view addSubview:myTable];
    		cellTitles = @[@"Twitowie", @"Bill Greyskull", @"Moonglampers", @"Psit", @"Duncan WJ Palmer", @"Sajuma", @"Victor_lee", @"Jugger-naut", @"Javiersanagustin", @"Velouria!"];
}

-(void)tableView:(UITableView *)tableView expandCell:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
	[[cell.contentView viewWithTag:10] removeFromSuperview];
	UIButton* purchaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	purchaseButton.frame = CGRectMake(600, 150, 120, 40);
	purchaseButton.alpha = 0;
	[purchaseButton setTitle:@"Purchase Now!" forState:UIControlStateNormal];
	purchaseButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:13];
	purchaseButton.backgroundColor = [UIColor grayColor];
	[purchaseButton setTintColor:[UIColor whiteColor]];
	[cell.contentView addSubview:purchaseButton];
	purchaseButton.tag = 10;
	
	[UIView animateWithDuration:.5 animations:^{
		cell.detailTextLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
		purchaseButton.frame = CGRectMake(450, 150, 120, 40);
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
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath isExpanded:(BOOL)isexpanded
{
	//you can define different heights for each cell. (then you probably have to calculate the height or e.g. read pre-calculated heights from an array
	if (isexpanded)
		return 200;
	
	return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath isExpanded:(BOOL)isExpanded
{
	static NSString *CellIdentifier = @"aCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell)
	{
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		UIImageView* expandGlyph = [[UIImageView alloc] initWithFrame:CGRectMake(560, 45, 15, 10)];
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
	
	
	cell.textLabel.text = [cellTitles objectAtIndex:indexPath.row % 10 ];
	cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", indexPath.row % 10 + 1]];
    
	
	if (!isExpanded) //prepare the cell as if it was collapsed! (without any animation!)
	{
		cell.detailTextLabel.text = @"Lorem ipsum dolor sit amet";
		[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(0);
	}
	else ///prepare the cell as if it was expanded! (without any animation!)
	{
		cell.detailTextLabel.text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
		[cell.contentView viewWithTag:7].transform = CGAffineTransformMakeRotation(3.14);
		
		[[cell.contentView viewWithTag:10] removeFromSuperview];
		UIButton* purchaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		purchaseButton.frame = CGRectMake(500, 150, 80, 40);
		[purchaseButton setTitle:@"Purchase Now!" forState:UIControlStateNormal];
		purchaseButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:10];
		purchaseButton.backgroundColor = [UIColor grayColor];
		[purchaseButton setTintColor:[UIColor whiteColor]];
		[cell.contentView addSubview:purchaseButton];
		purchaseButton.tag = 10;
	}
	return cell;
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
