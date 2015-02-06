
#import "CenterViewController.h"
#import "Color.h"
#import "LeftPanelViewController.h"
#import "MSViewControllerSlidingPanel.h"

#pragma mark - Global variables

/**
 *  Cells' identifier.
 */
NSString    *g_LPVCCellIdentifier = @"CellIdentifier";

#pragma mark - LeftPanelViewController interface

@interface LeftPanelViewController () <UITableViewDataSource, UITableViewDelegate>

#pragma mark Properties
/** @name Properties */

@property (nonatomic, strong)   NSArray *sections;

#pragma mark Filling sections


@end

#pragma mark - LeftPanelViewController implementation

@implementation LeftPanelViewController

@synthesize centerView;



/**
 *  Creates the view that the controller manages.
 */
- (void)loadView
{

    [super loadView];
    
    self.category = @[@"hotdog",
                      @"pizza",
                      @"drink",
                      @"dessert",
                      @"ALL"];
    [[self slidingPanelController] setLeftPanelMaximumWidth:180];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}

#pragma mark Filling sections

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"111");
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    // Configure the cell...
    
    //    UILabel *cellLabel = (UILabel *)[cell viewWithTag:1];
    //    cellLabel.text = self.category[indexPath.row];
    cell.textLabel.text = self.category[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.category.count;
}


- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 //   centerView = [[CenterViewController alloc] init];
 //   [centerView reload:@"122"];
    [[self slidingPanelController] closePanel];
    return nil;
}



@end
