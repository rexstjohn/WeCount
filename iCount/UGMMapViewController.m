//
//  UGMMapViewController.m
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import "UGMMapViewController.h"
#import "UGMAnnotation.h"
#import "MKMapView+Zooming.h"
#import "UGMClientModel.h"
#import "UGMReportsTableViewController.h"

@interface UGMMapViewController ()
@end

@implementation UGMMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *someClients = [[NSMutableArray alloc] initWithCapacity:4];
    
    self.title = @"Map";
    // Do any additional setup after loading the view.
    self.mapView.showsUserLocation = YES;
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    
    // center on seattle
    CLLocationDegrees lat = 47.598900;
    CLLocationDegrees lon = -122.321692;
    CLLocation *someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    
    // Create annotations
    UGMAnnotation *annotation = [[UGMAnnotation alloc]init];
    annotation.coordinate = someLocation.coordinate;
    annotation.subtitle = @"Jan 2nd - I5 Bridge";
    annotation.title = @"Josh S.";
    annotation.image = @"bench";
    annotation.index = 0;
    [self.mapView addAnnotation:annotation];
    UGMClientModel *cma = [[UGMClientModel alloc] init];
    cma.name = annotation.title;
    cma.image = @"example_client";
    cma.location = [someLocation copy];
    [someClients addObject:cma];
    
    lat = 47.598448;
    lon = -122.325624;
    someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    
    annotation = [[UGMAnnotation alloc]init];
    annotation.coordinate = someLocation.coordinate;
    annotation.subtitle = @"April 3rd - Hing Hay Park";
    annotation.title = @"Jesus J.";
    annotation.index = 1;
    annotation.image = @"trees";
    [self.mapView addAnnotation:annotation];
    cma = [[UGMClientModel alloc] init];
    cma.name = annotation.title;
    cma.image = @"example_3";
    cma.location = [someLocation copy];
    [someClients addObject:cma];
    
    lat = 47.600988;
    lon = -122.324615;
    someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    
    annotation = [[UGMAnnotation alloc]init];
    annotation.coordinate = someLocation.coordinate;
    annotation.subtitle = @"June 7th - Yesler Overpass";
    annotation.title = @"Karen A.";
    annotation.image = @"door";
    annotation.index = 2;
    [self.mapView addAnnotation:annotation];
    cma = [[UGMClientModel alloc] init];
    cma.name = annotation.title;
    cma.image = @"example_2";
    cma.location = [someLocation copy];
    [someClients addObject:cma];
    
    lat = 47.600648;
    lon = -122.332962;
    someLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];

    annotation = [[UGMAnnotation alloc]init];
    annotation.coordinate = someLocation.coordinate;
    annotation.subtitle = @"March 4th - Red Square";
    annotation.title = @"Igor L. ";
    annotation.image = @"vehicle";
    annotation.index = 3;
    [self.mapView addAnnotation:annotation];
    cma = [[UGMClientModel alloc] init];
    cma.name = annotation.title;
    cma.image = @"example_4";
    cma.location = [someLocation copy];
    [someClients addObject:cma];
    [self.mapView zoomToFitAnnotationsAnimated:NO];
    self.clients = [[NSArray alloc] initWithArray:someClients];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If the annotation is the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[UGMAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKAnnotationView*    pinView = (MKAnnotationView*)[mapView
                                                                 dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                      reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.canShowCallout = YES;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            button.frame = CGRectMake(0, 0, 23, 23);
            pinView.rightCalloutAccessoryView = button;
            NSString *imageValue = ((UGMAnnotation*)annotation).image;
            UIImage *imageToUse =[UIImage imageNamed:imageValue];
            pinView.image = imageToUse;
            
            [pinView setContentMode:UIViewContentModeScaleAspectFit];
            [pinView setFrame:CGRectMake(0, 0, 32, 32)];

        }
        else{
            pinView.annotation = annotation;
        }
        
        return pinView;
    }
    
    return nil;
}

-(void)calloutTapped:(MKPinAnnotationView*)pinView{
    
    [self performSegueWithIdentifier:@"ShowReportSegue" sender:(UGMAnnotation*)pinView.annotation];
}

- (void)mapView:(MKMapView *)map annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    [self performSegueWithIdentifier:@"ShowReportSegue" sender:(UGMAnnotation*)view.annotation];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *segueId = [segue identifier];
    
    if([segueId isEqualToString:@"ShowReportSegue"] == YES){
            UGMAnnotation *note = (UGMAnnotation*)sender;
    UINavigationController *nav =[segue destinationViewController];
    UGMReportsTableViewController *reports = (UGMReportsTableViewController*)nav.topViewController;
    reports.selectedClientIndex = note.index;
        reports.clients = self.clients;
    }

}

@end
