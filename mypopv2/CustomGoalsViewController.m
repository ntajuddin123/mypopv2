//
//  CustomGoalsViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-30.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "CustomGoalsViewController.h"

@interface CustomGoalsViewController ()

@end

@implementation CustomGoalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(dismissModalViewControllerAnimated)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
    self.navigationItem.title = @"Customize My Goals";
}

- (void)dismissModalViewControllerAnimated {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
