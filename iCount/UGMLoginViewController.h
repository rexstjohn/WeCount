//
//  UGMLoginViewController.h
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UGMLoginViewController : UIViewController<UITextFieldDelegate>
-(IBAction)dismissLogin:(id)sender;
@property(nonatomic,strong) IBOutlet UITextField *username;
@property(nonatomic,strong) IBOutlet UITextField *password;
@end
