//
//  BaseQuestionViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-15.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "BaseQuestionViewController.h"

@interface BaseQuestionViewController ()

@end

@implementation BaseQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    if (![self.skipQuestion isEqual:[NSNull null]]) {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"MyPOP"
                                                                       message:self.skipQuestion
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
        
        UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             
                                                             [self.rootViewController goToNextContentViewController];
                                                             
                                                         }];
        
        [alert addAction:yesAction];
        [alert addAction:noAction];
        [self presentViewController:alert animated:YES completion:nil];

    }
    
    self.tabBarController.navigationItem.title = @"Track MyPOP";
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Previous"
                                                                   style:UIBarButtonItemStylePlain target:self action:@selector(previousButtonPressed)];
    self.tabBarController.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                    style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed)];
    self.tabBarController.navigationItem.rightBarButtonItem = rightButton;

}

//- (void)previousButtonPressed {
//    
//    [self.rootViewController goToPreviousViewController];
//}

- (void)nextButtonPressed {
    
    [self.rootViewController goToNextContentViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
