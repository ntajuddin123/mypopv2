//
//  ViewController.h
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-02.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (unsafe_unretained, nonatomic) IBOutlet UIPickerView *surgeryPicker;

@property (unsafe_unretained, nonatomic) IBOutlet UITextField *surgeryTextField;
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *dateTextField;

@property (unsafe_unretained, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

