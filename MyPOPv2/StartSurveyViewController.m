//
//  StartSurveyViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-14.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "StartSurveyViewController.h"
#import "BaseQuestionViewController.h"

@interface StartSurveyViewController ()

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *contentPageRestorationIDs; // NSString
@property (strong, nonatomic) NSArray *questions; // NSString

@end

@implementation StartSurveyViewController

@synthesize contentPageRestorationIDs = _contentPageRestorationIDs;
@synthesize questions = _questions;

#pragma mark - Setters and Getters
- (NSArray *)contentPageRestorationIDs
{
    if (!_contentPageRestorationIDs) {
        _contentPageRestorationIDs = @[@"YesNoVC", @"YesNoVC", @"SliderVC", @"SliderVC", @"YesNoVC"];
    }
    
    return _contentPageRestorationIDs;
}

- (NSArray *)questions
{
    if (!_questions) {
        _questions = @[@"Question 1", @"Question 2", @"Question 3", @"Question 4", @"Question 5"];
    }
    
    return _questions;
    
}


#pragma mark - View Controller Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    // Create the page view controller.
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SurveyPageViewController"];
    self.pageViewController.dataSource = self;
    
    // Instantiate the first view controller.
    UIViewController *startingViewController = [self viewControllerAtIndex:0];
    
    [self.pageViewController setViewControllers:@[startingViewController]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:NO
                                     completion:^(BOOL finished) {
                                         // Completion code
                                     }];
    
    // Add the page view controller to this root view controller.
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - UIPageViewControllerDataSource
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
   return self.questions.count;;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
//    NSString *vcRestorationID = viewController.restorationIdentifier;
//    NSUInteger index = [self.contentPageRestorationIDs indexOfObject:vcRestorationID];
//    

    BaseQuestionViewController *bvc = (BaseQuestionViewController *)viewController;
    NSUInteger index = bvc.qnumber;
    
    
    
    
    if (index == 0) {
        return nil;
    }

    return [self viewControllerAtIndex:index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
//    NSString *vcRestorationID = viewController.restorationIdentifier;
    BaseQuestionViewController *bvc = (BaseQuestionViewController *)viewController;
    NSUInteger index = bvc.qnumber;
    
    
//    NSUInteger index = [self.contentPageRestorationIDs indexOfObject:vcRestorationID];
//    
    if (index == self.questions.count - 1) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index + 1];
}

#pragma mark - Private Methods
- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (index >= self.questions.count) {
        return nil;
    }

    // Create a new view controller.
    BaseQuestionViewController *contentViewController = (BaseQuestionViewController *)[self.storyboard instantiateViewControllerWithIdentifier:self.contentPageRestorationIDs[index]];
    
    // Set any data needed by the VC here
    contentViewController.rootViewController = self;
    contentViewController.question = [self.questions objectAtIndex:index];
    contentViewController.qnumber = index;
    
    return contentViewController;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)startSurveyButtonPressed:(id)sender {
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"YesNoVC"];
//    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
