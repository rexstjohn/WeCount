//
//  UGMReportViewcontroller.m
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import "UGMReportTableViewcontroller.h"
#import "UGMClientModel.h"

@interface UGMReportTableViewcontroller ()

@end

@implementation UGMReportTableViewcontroller

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
    // Do any additional setup after loading the view.
    self.title = @"Report";
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UGMClientModel * client =[self.clients objectAtIndex:self.selectedClientIndex];
    
    UIImage *image = (client == nil)?[UIImage imageNamed:@"no-image.jpg"]:[UIImage imageNamed:client.image];

    self.imageView.image = image;
    self.userName.text = (client == nil)?@"Not Set":client.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneEditing:(id)sender {
    [self.locationDescription resignFirstResponder];
    [self.living resignFirstResponder];
}

-(IBAction)dismissReport:(id)sender{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    return YES;
}

- (BOOL) textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO;
    }else{
        return YES;
    }
}
@end
