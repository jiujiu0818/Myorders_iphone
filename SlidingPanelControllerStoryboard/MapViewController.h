//
//  MapViewController.h
//  SlidingPanelControllerStoryboard
//
//  Created by 金 秋瑞 on 4/23/14.
//  Copyright (c) 2014 Sébastien MICHOY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "mapNavigationController.h"
#import "dbMap.h"

@interface MapViewController : UIViewController<MKAnnotation,CLLocationManagerDelegate,MKMapViewDelegate>{
    MKMapView *mapView;
//    mapNavigationController *worldCitiesListController;
//    UINavigationController  *worldCitiesListNavigationController;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (copy,nonatomic) NSDictionary *selection;
//@property (nonatomic, retain, readonly) mapNavigationController *worldCitiesListController;
//@property (nonatomic, retain, readonly) UINavigationController *worldCitiesListNavigationController;
@property (nonatomic, weak) IBOutlet UIView *dataView;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UILabel *open24HrsTodayLabel;
@property (nonatomic, weak) IBOutlet UILabel *openNowLabel;
@property (nonatomic, weak) IBOutlet UILabel *phoneLabel;
@property (nonatomic, weak) IBOutlet UILabel *featuresLabel;
@property (nonatomic, weak) IBOutlet UIButton *phoneButtonValue;
@property (nonatomic, weak) IBOutlet UILabel *featuresLabelValue;
@property (nonatomic,strong) dbMap *location;

@end
