//
//  ViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-02.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {

    NSArray *_pickerData;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _pickerData = @[@"Dental Surgery", @"Orthopedic Surgery", @"ENT Surgery", @"General Surgery"];
    
    self.surgeryPicker.dataSource = self;
    self.surgeryPicker.delegate = self;
    
    self.surgeryPicker.hidden = YES;
    //self.surgeryTextField.text = _pickerData[0];
    
    self.surgeryTextField.delegate = self;
    
    self.dateTextField.delegate = self;
    self.dateTextField.inputView = self.datePicker;
    self.datePicker.hidden = YES;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.tabBarController.navigationItem.title = @"My Profile";
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
    self.tabBarController.navigationItem.leftBarButtonItem = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (pickerView == self.surgeryPicker) {
        self.surgeryTextField.text = _pickerData[row];
        self.surgeryPicker.hidden = YES;
    } else {
        
        //UIDatePicker *picker = (UIDatePicker*)txtFieldBranchYear.inputView;
        //[picker setMaximumDate:[NSDate date]];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        NSDate *eventDate = self.datePicker.date;
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        
        NSString *dateString = [dateFormat stringFromDate:eventDate];
        self.dateTextField.text = [NSString stringWithFormat:@"%@",dateString];
     
        self.datePicker.hidden = YES;
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField == self.surgeryTextField) {
        self.surgeryPicker.hidden = NO;
        self.surgeryTextField.text = @"";
    } else {
        self.datePicker.hidden = NO;
    }
    
    return NO;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (textField == self.dateTextField) {
        self.datePicker.hidden = YES;
    }
    return NO;
}
@end
