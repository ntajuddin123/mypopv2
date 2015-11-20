//
//  SelectMultipleViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-19.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "SelectMultipleViewController.h"

@interface SelectMultipleViewController ()

@end

@implementation SelectMultipleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.questionLabel setText:self.question];
    
    [self loadQuestions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Functions
- (void)loadQuestions {
    
    if (self.qnumber == 6) {
        
    }
    
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
