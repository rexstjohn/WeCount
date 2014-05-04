//
//  UGMReportViewcontroller.h
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UGMReportTableViewcontroller : UITableViewController <UITextFieldDelegate, UITextViewDelegate>
-(IBAction)dismissReport:(id)sender;
@property(nonatomic,strong) IBOutlet UIImageView *imageView;
@property(nonatomic,strong) IBOutlet UILabel *userName;
@property(nonatomic,strong) NSArray *clients;
@property(nonatomic,assign) NSInteger selectedClientIndex;



@property(nonatomic,strong) IBOutlet UITextField* location;
@property(nonatomic,strong) IBOutlet UITextField *needs;
@property(nonatomic,strong) IBOutlet UITextView *living;
@property(nonatomic,strong) IBOutlet UITextView *locationDescription;
@end
