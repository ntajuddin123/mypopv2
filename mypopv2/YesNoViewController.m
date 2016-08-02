//
//  YesNoViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-14.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "YesNoViewController.h"

@interface YesNoViewController ()

@end

@implementation YesNoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.questionLabel setText:self.question];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)yesButtonPressed:(id)sender {
    
    [self buttonPressed];
}

- (IBAction)noButtonPressed:(id)sender {
    
    [self buttonPressed];
}


- (void) buttonPressed {
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"SliderVC"];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
     [self.rootViewController goToNextContentViewController];
    
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
