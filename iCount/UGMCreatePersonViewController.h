//
//  UGMCreatePersonViewController.h
//  iCount
//
//  Created by Rex St John on 5/3/14.
//  Copyright (c) 2014 Union Gospel Mission. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    UGMAgeSelector,
    UGMGenderSelector,
    UGMEthnicitySelector
} UGMSelectorType;

@interface UGMCreatePersonViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
-(IBAction)dismissNewPerson:(id)sender;
@property (strong, nonatomic) IBOutlet      UIPickerView *picker;
@property (strong, nonatomic) IBOutlet      UIImageView *imageView;
@property (nonatomic, assign) UGMSelectorType selectorType;
@property(nonatomic,strong) IBOutlet UIButton *genderButton;
@property(nonatomic,strong) IBOutlet UIButton *ethnicityButton;
@property(nonatomic,strong) IBOutlet UIButton *ageButton;
@property(nonatomic,strong) IBOutlet UITextView *textView;

-(IBAction)showGender:(id)sender;
-(IBAction)showAges:(id)sender;
-(IBAction)showEthnicities:(id)sender;
-(IBAction)didTapSave:(id)sender;
@end
