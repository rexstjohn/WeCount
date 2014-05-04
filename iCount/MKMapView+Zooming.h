//
//  MKMapView+Zooming.h
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (Zooming)

-(MKMapRect)mapRectToFitAnnotations:(NSArray*)annotations;
-(void)zoomToFitAnnotationsAnimated:(BOOL)isAnimated;
-(void)zoomtofitAnnotationsCenteredOnLocation:(CLLocation*)location animated:(BOOL)animated;
-(void)zoomToLocation:(CLLocation*)location withMarginInMiles:(CGFloat)miles animated:(BOOL)animated;
-(void)zoomToUserWithMarginInMiles:(CGFloat)miles;

-(MKZoomScale)zoomScale;
- (MKMapRect)translateMapRect:(MKMapRect)oldMapRect
      insetScreenPointsOnLeft:(CGFloat)leftScreenPoints
       insetScreenPointsAbove:(CGFloat)topScreenPoints
                       inView:(UIView*)view;

@end