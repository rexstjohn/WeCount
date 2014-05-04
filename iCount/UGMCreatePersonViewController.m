//
//  UGMCreatePersonViewController.m
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import "UGMCreatePersonViewController.h"
#import "UGMClientModel.h"

@interface UGMCreatePersonViewController ()
@property(nonatomic,strong) NSArray *ethnicities;
@property(nonatomic,strong) NSArray *gender;
@property(nonatomic,strong) NSArray *ages;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,assign) NSInteger genderval;
@property(nonatomic,assign) NSInteger ethnicity;
@end

@implementation UGMCreatePersonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Add New Person";
    self.ethnicities = @[@"Caucasian", @"Native American", @"Hispanic", @"Asian", @"African / African American", @"Other"];
    self.gender = @[@"Male", @"Female", @"TQ/Other", @"Unknown"];
    self.ages = @[@"Under 18", @"18-20", @"25-40", @"41-60", @"60+"];
    // Do any additional setup after loading the view.
}

-(IBAction)dismissNewPerson:(id)sender{
    [self performSegueWithIdentifier:@"CloseNewPersonSegue" sender:nil];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    switch (self.selectorType) {
        case UGMAgeSelector:{
            return self.ages.count;
        }
        case UGMEthnicitySelector:{
            return self.ethnicities.count;
        }
        case UGMGenderSelector:{
            return self.gender.count;
        }
        default:{
            return self.ages.count;
        }
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    switch (self.selectorType) {
        case UGMAgeSelector:{
            return [self.ages objectAtIndex:row];
        }
        case UGMEthnicitySelector:{
            return [self.ethnicities objectAtIndex:row];
        }
        case UGMGenderSelector:{
            return [self.gender objectAtIndex:row];
        }
        default:{
            return [self.ages objectAtIndex:row];
        }
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (self.selectorType) {
        case UGMAgeSelector:{
            self.age = row;
            break;
        }
        case UGMEthnicitySelector:{
            self.ethnicity = row;
            break;
        }
        case UGMGenderSelector:{
            self.genderval = row;
            break;
        }
        default:{
            //
            break;
        }
    }
    [self setValues];
}

#pragma mark - image picker

-(IBAction) getPhoto:(id) sender {
	UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
	[self presentViewController:picker animated:YES completion:^{
        
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissViewControllerAnimated:YES completion:^{
        
    }];
	self.imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

#pragma mark - Selectors.

-(IBAction)showGender:(id)sender{
    [self setValues];
    self.selectorType = UGMGenderSelector;
    [self.picker reloadAllComponents];
}

-(IBAction)showAges:(id)sender{
    [self setValues];
    self.selectorType = UGMAgeSelector;
    [self.picker reloadAllComponents];
}

-(IBAction)showEthnicities:(id)sender{
    [self setValues];
    self.selectorType = UGMEthnicitySelector;
    [self.picker reloadAllComponents];
}

-(void)setValues{
    [self.ageButton setTitle:[self.ages objectAtIndex:self.age] forState:UIControlStateNormal];
    [self.genderButton setTitle:[self.gender objectAtIndex:self.genderval] forState:UIControlStateNormal];
    [self.ethnicityButton setTitle:[self.ethnicities objectAtIndex:self.ethnicity] forState:UIControlStateNormal];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(IBAction)didTapSave:(id)sender{
    UGMClientModel *client = [[UGMClientModel alloc] init];
    client.name = self.textView.text;
    client.image = @"example_2";
    [self performSegueWithIdentifier:@"CloseNewPersonSegue" sender:client];
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView
             attributedTitleForRow:(NSInteger)row
                      forComponent:(NSInteger)component
{
    NSString *aString;
    switch (self.selectorType) {
        case UGMAgeSelector:{
            aString = [self.ages objectAtIndex:row];
            break;
        }
        case UGMEthnicitySelector:{
            aString = [self.ethnicities objectAtIndex:row];
            break;
        }
        case UGMGenderSelector:{
            aString = [self.gender objectAtIndex:row];
            break;
        }
        default:{
            aString = [self.ages objectAtIndex:row];
            break;
        }
    }
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:aString attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
    
}
@end
