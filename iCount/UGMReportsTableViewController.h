//
//  UGMReportsTableViewController.h
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UGMReportsTableViewController : UITableViewController

@property(nonatomic,assign) NSInteger selectedClientIndex;
@property(nonatomic,strong) NSArray *clients;
@end
