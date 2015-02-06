//
//  MapViewController.m
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 4/23/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import "MapViewController.h"
#import "WorldCity.h"
#import "MapLocation.h"


@interface MapViewController ()

@end

@implementation MapViewController


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
    NSLog(self.location.name);
    self.navigationController.navigationBarHidden = NO;
/*    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"banner.png"] forBarMetrics:UIBarMetricsDefault];
    UIColor *color = [UIColor colorWithRed:46.0f/255.0f green:87.0f/255.0f blue:29.0f/255.0f alpha:1.0f];
    self.navigationController.navigationBar.tintColor = color;*/
    // Do any additional setup after loading the view.
    MKCoordinateRegion current = mapView.region;
            

    
    float latitude = [self.location.latitude floatValue];
    float longtitude = [self.location.longtitude floatValue];
    CLLocationCoordinate2D temp = (CLLocationCoordinate2D){latitude,longtitude};
    
    //调整地图位置和缩放比例
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(temp, 1000, 1000);
    _mapView.delegate = self;
    [_mapView setRegion:viewRegion animated:YES];
    
            MapLocation *annotation = [[MapLocation alloc] init];
           annotation.streetAddress = self.location.name;
            annotation.coordinate = temp;
            [_mapView addAnnotation:annotation];
    
    
    [self.addressLabel setText:[self.location address]];
    [self.open24HrsTodayLabel setText:NSLocalizedString([self.location open24], nil)];
    [self.openNowLabel setText:NSLocalizedString([self.location status], nil)];
    [self.phoneLabel setHidden:NO];
    
    [self.phoneButtonValue setHidden:NO];
    [self.phoneButtonValue setEnabled:YES];
    [self.phoneButtonValue setTitle:[self.location phone] forState:UIControlStateNormal];
   
        CGRect featuresFrame = self.featuresLabel.frame;
        CGRect featuresValueFrame = self.featuresLabelValue.frame;
        
        featuresFrame.origin.y = self.phoneLabel.frame.origin.y;
        featuresValueFrame.origin.y = self.phoneButtonValue.frame.origin.y;
        
        [self.featuresLabel setFrame:featuresFrame];
        [self.featuresLabelValue setFrame:featuresValueFrame];
    [self.featuresLabel setHidden:NO];
    [self.featuresLabelValue setHidden:NO];
    

    NSString *features = [self.location features];
    [self.featuresLabelValue setText:features];
    
//    [self.openNowLabel.layer setCornerRadius:3.0f];
//    [self.openNowLabel setBackgroundColor:self.navigationController.view.window.tintColor];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *) mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>) annotation {
	MKPinAnnotationView *annotationView
	= (MKPinAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:@"PIN_ANNOTATION"];
	if(annotationView == nil) {
		annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                         reuseIdentifier:@"PIN_ANNOTATION"];
	}
    
	annotationView.pinColor = MKPinAnnotationColorGreen;
	annotationView.animatesDrop = YES;
	annotationView.canShowCallout = YES;
	
	return annotationView;
}

- (void)animateToWorld:(WorldCity *)worldCity
{
    MKCoordinateRegion current = mapView.region;
    MKCoordinateRegion zoomOut = { { (current.center.latitude + worldCity.coordinate.latitude)/2.0 , (current.center.longitude + worldCity.coordinate.longitude)/2.0 }, {90, 90} };
    [mapView setRegion:zoomOut animated:YES];
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)theMapView withError:(NSError *)error {
    NSLog(@"error : %@",[error description]);
}

- (IBAction)tapPhoneNumber:(id)sender
{
    if (![self.phoneButtonValue.currentTitle isEqualToString:@""]) {
        NSString *url = [NSString stringWithFormat:@"%@%@", @"tel://", self.phoneButtonValue.currentTitle];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    }
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
