//
//  UGMMapViewController.h
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface UGMMapViewController : UIViewController <MKMapViewDelegate>
@property(nonatomic,strong) IBOutlet MKMapView *mapView;
@property(nonatomic,strong) NSArray *clients;
@end
