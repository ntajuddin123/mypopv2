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
@property (strong, nonatomic) NSArray *skipStrings;

@end

@implementation StartSurveyViewController

@synthesize contentPageRestorationIDs = _contentPageRestorationIDs;
@synthesize questions = _questions;
@synthesize skipStrings = _skipStrings;


#pragma mark - Setters and Getters
- (NSArray *)contentPageRestorationIDs
{
    if (!_contentPageRestorationIDs) {
        _contentPageRestorationIDs = @[@"YesNoVC",
                                       @"YesNoVC",
                                       @"SliderVC",
                                   //    @"SliderVC", // selection
                                   //    @"YesNoVC",  // body diagram
                                       @"YesNoVC",
                                       @"SelectMultipleVC",
                                       @"YesNoVC",
                                   //    @"YesNoVC",
                                   //    @"YesNoVC",
                                    //   @"YesNoVC",
                                    //   @"YesNoVC",
                                   //    @"YesNoVC",
                                   //    @"YesNoVC",
                                      // @"YesNoVC",
                                       @"SelectMultipleWithSliderVC", // selection
                                   //    @"SelectMultipleVC", // selection
                                       @"SelectMultipleVC", // selection
                                       @"SliderVC"];
    }
    
    return _contentPageRestorationIDs;
}

- (NSArray *)questions
{
    if (!_questions) {
        _questions =   @[@"Have you had pain related to surgery?",
                         @"Do you have pain right now?",
                         @"Show your WORST pain since your last entry",
                        // @"When you had your WORST pain, how long did it last?",
                        // @"Show WHERE YOU HURT",
                         @"Does your pain BUG or ANNOY you right now?",
                         @"Touch the words that best describe your pain",
                         @"Does your pain make you feel MAD/ANGRY?",
                        // @"Does your pain make you feel SAD?",
                        // @"Does your pain make you feel WORRIED?",
                       //  @"Does pain affect your SLEEP?",
                        // @"Does pain get in the way of you DOING THINGS?",
                        // @"Does pain affect being able to move around (e.g. walking, getting out of bed)?",
                        // @"Does pain affect your eating or drinking?",
                         //@"Does you experience any other symptoms related to your pain?",
                         @"Have you taken any pain medicine?",
                        // @"Did your pain medicines cause any side effects?",
                         @"What other strategies did you use to try and reduce your pain?",
                         @"Show how much you were able to MANAGE your pain"];
    }
    
    return _questions;
    
}

- (NSArray *)skipStrings
{
    if (!_skipStrings) {
        _skipStrings = @[[NSNull null],
                         [NSNull null],
                         [NSNull null],
                     //    [NSNull null],
                    //     @"Has the place where you hurt changed since your last entry?",
                         [NSNull null],
                         @"Have the words to describe your pain changed since your last entry?",
                         [NSNull null],
                    //     [NSNull null],
                    //     [NSNull null],
                     //    [NSNull null],
                     //    [NSNull null],
                     //    [NSNull null],
                     //    [NSNull null],
                     //    @"Have your other symptoms related to your pain changed since your last entry?",
                         @"Has your pain medicine changed since your last entry?",
                      //   @"Did your pain medicine side effects change since your last entry?",
                         @"Have the other strategies you used to try and reduce your pain changed since your last entry?",
                         [NSNull null]];
        

    }
    
    return _skipStrings;
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
    BaseQuestionViewController *bvc = (BaseQuestionViewController *)viewController;
    NSUInteger index = bvc.qnumber;
    
    if (index == 0) {
        return nil;
    }

    return [self viewControllerAtIndex:index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    BaseQuestionViewController *bvc = (BaseQuestionViewController *)viewController;
    NSUInteger index = bvc.qnumber;
    
    if (index == self.questions.count - 1) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index + 1];
}

#pragma mark - Public Methods
- (void)goToNextContentViewController
{
  
    BaseQuestionViewController *bvc = (BaseQuestionViewController *)[self.pageViewController.viewControllers objectAtIndex:0];
    NSUInteger index = bvc.qnumber;

    UIViewController *nextViewController = [self viewControllerAtIndex:index + 1];
    
    [self.pageViewController setViewControllers:@[nextViewController]
                                      direction:UIPageViewControllerNavigationDirectionForward
                                       animated:YES
                                     completion:^(BOOL finished) {
                                         // Completion code
                                     }];
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
    
    contentViewController.skipQuestion = [self.skipStrings objectAtIndex:index] == [NSNull null] ? [NSNull null] : [self.skipStrings objectAtIndex:index];
    
    
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
