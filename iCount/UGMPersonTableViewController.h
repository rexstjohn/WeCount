//
//  UGMPersonTableViewController.h
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UGMPersonTableViewController : UITableViewController
-(IBAction)showNewPersonModal:(id)sender;
@property(nonatomic,strong) NSArray *clients;
@property(nonatomic,assign) NSInteger selectedClientIndex;
@end
