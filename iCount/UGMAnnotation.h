//
//  UGMAnnotation.h
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface UGMAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * subtitle;
@property (nonatomic, copy) NSString * image;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign)CLLocationCoordinate2D coordinate;

@end
