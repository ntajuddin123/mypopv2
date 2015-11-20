//
//  SelectMultipleWithSliderViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-20.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "SelectMultipleWithSliderViewController.h"

@interface SelectMultipleWithSliderViewController ()

@end

@implementation SelectMultipleWithSliderViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [self.questionLabel setText:self.question];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
