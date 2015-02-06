//
//  orderController.m
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 5/1/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import "orderController.h"
#import "SingleSample.h"

@interface orderController ()

@end

@implementation orderController

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
    // Do any additional setup after loading the view.
    [SingleSample sharedSingleSample].myOrder= [[NSMutableArray alloc]init];
    [SingleSample sharedSingleSample].storeID = self.storeID;
    self.navigationController.navigationBarHidden = NO;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showMenu)];
    self.navigationItem.rightBarButtonItem = rightButton;

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
