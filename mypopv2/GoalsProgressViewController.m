//
//  GoalsProgressViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-27.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "GoalsProgressViewController.h"

@interface GoalsProgressViewController ()

@end

@implementation GoalsProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(dismissModalViewControllerAnimated)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
    self.navigationItem.title = @"My Progress";
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


#pragma mark - Private

- (void)dismissModalViewControllerAnimated {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
