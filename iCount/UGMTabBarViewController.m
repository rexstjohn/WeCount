//
//  UGMTabBarViewController.m
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import "UGMTabBarViewController.h"
#import "UGMAnnotation.h"
#import "UGMClientModel.h"
#import "UGMMapViewController.h"
#import "UGMPersonTableViewController.h"

@interface UGMTabBarViewController ()

@end

@implementation UGMTabBarViewController

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
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    NSMutableArray *someClients = [[NSMutableArray alloc] initWithCapacity:4];
    
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
    cma = [[UGMClientModel alloc] init];
    cma.name = annotation.title;
    cma.image = @"example_4";
    cma.location = [someLocation copy];
    [someClients addObject:cma];
    self.clients = [[NSArray alloc] initWithArray:someClients];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    switch (item.tag) {
        case 0:{
            UINavigationController *nav =[self.viewControllers objectAtIndex:item.tag];
            UGMMapViewController *map = (UGMMapViewController*)nav.topViewController;
            map.clients = self.clients;
            break;
        }
        case 1:{
            UINavigationController *nav =[self.viewControllers objectAtIndex:item.tag];
            UGMPersonTableViewController *persons = (UGMPersonTableViewController*)nav.topViewController;
            persons.clients = self.clients;
            break;
        }
        case 2:
            
            break;
        default:
            break;
    }
}

@end
