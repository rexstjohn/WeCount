//
//  UGMClientModel.h
//  iCount
//
//  Created by Rex St John on 5/4/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface UGMClientModel : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *image;
@property(nonatomic,strong) CLLocation *location;

@end
