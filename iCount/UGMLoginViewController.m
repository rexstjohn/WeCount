//
//  UGMLoginViewController.m
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import "UGMLoginViewController.h"

@interface UGMLoginViewController ()

@end

@implementation UGMLoginViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"username..." attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    self.username.attributedPlaceholder = str;
    str = [[NSAttributedString alloc] initWithString:@"password..." attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    self.password.attributedPlaceholder = str;
}

-(IBAction)dismissLogin:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end
