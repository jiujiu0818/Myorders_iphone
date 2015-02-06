//
//  mapNavigationController.m
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 4/23/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import "mapNavigationController.h"
#import "WorldCity.h"
#import "dbMap.h"
#import "MapViewController.h"
#import "SingleSample.h"
#import "REFrostedViewController.h"

@interface mapNavigationController ()

@end

@implementation mapNavigationController

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
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showMenu)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    if ([SingleSample sharedSingleSample].storeID) {
        self.storeID = [SingleSample sharedSingleSample].storeID;
    }
    else self.storeID = @"1";
    
   // allLocation = [dbMap findAll];
        allLocation = [dbMap findByStore:self.storeID];
    // load our data from a plist file inside our app bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cityList" ofType:@"plist"];
    NSArray *cities = [NSArray arrayWithContentsOfFile:path];
    
    self.cityList = [[NSMutableArray alloc] initWithCapacity:[cities count]];
    
    NSDictionary *city;
    for (city in cities)
    {
        WorldCity *newCity = [[WorldCity alloc] init];
        newCity.name = [city objectForKey:@"cityNameKey"];
        newCity.latitude = [city objectForKey:@"latitudeKey"];;
        newCity.longitude = [city objectForKey:@"longitudeKey"];
        
        [self.cityList addObject:newCity];
 //       [newCity release];
    }
    self.locmanager = [[CLLocationManager alloc]init];
    self.locmanager.delegate = self;
    [self.locmanager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locmanager startUpdatingLocation];
//    NSLog(@"currenet:%@",[self.locmanager ]);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}

#pragma mark Core Location委托方法用于实现位置的更新
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
 /*   CLLocation *currLocation = [locations lastObject];
	NSLog([NSString stringWithFormat:@"%3.5f",
                    currLocation.coordinate.latitude]);
	_txtLng.text = [NSString stringWithFormat:@"%3.5f",
                    currLocation.coordinate.longitude];
    _txtAlt.text = [NSString stringWithFormat:@"%3.5f",
                    currLocation.altitude];*/
    
}


- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    //停止定位
    [self.locmanager stopUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"error: %@",error);
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.tableView.frame = CGRectMake(0, 55, 320, self.view.frame.size.height-100);
    [self.tableView layoutSubviews];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table view methods

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [allLocation count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const kPlacesCellIdentifier = @"Cell";
    
  //  NSLog(@"%@",[NSString stringWithFormat:@"%0.2f km",[[self.locmanager location] distanceFromLocation:newLocation]/1000]);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlacesCellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kPlacesCellIdentifier];
        cell.editingAccessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 10)];
    view.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview:view];
                    
      NSInteger row = indexPath.row;
    dbMap *location  = [allLocation objectAtIndex:indexPath.row];
    
    WorldCity *worldCity = [self.cityList objectAtIndex:indexPath.row];
//    cell.textLabel.text = worldCity.name;
    float latitude = [location.latitude floatValue];
    float longtitude = [location.longtitude floatValue];
    NSLog([NSString stringWithFormat:@"%.3f, %.3f", latitude,longtitude]);
    
        CLLocation * newLocation = [[CLLocation alloc]initWithLatitude:latitude longitude:longtitude];
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *cellLabel2 = (UILabel *)[cell viewWithTag:2];
    cellLabel.text =  [location name];
    cellLabel2.text = [NSString stringWithFormat:@"%0.2f km",[[self.locmanager location] distanceFromLocation:newLocation]/1000];
    //[NSString stringWithFormat:@"%.3f, %.3f", worldCity.coordinate.latitude, worldCity.coordinate.longitude];
//    NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!%f",worldCity.coordinate.latitude);
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[location pic]]]];
	
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [delegate mapNavigationController:self didChooseWorldCity:[self.cityList objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
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
    
    if ([controller isKindOfClass:[MapViewController class]]) {
        MapViewController *mapIntroController = (MapViewController *)controller;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        //[detailController setDataString:[NSString stringWithFormat:@"%i",selectIndexPath.section]];
        dbMap *location= [allLocation objectAtIndex:indexPath.row];
        mapIntroController.location = location;
    }
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
