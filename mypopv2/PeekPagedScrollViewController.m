//
//  PeekPagedScrollViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-23.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "PeekPagedScrollViewController.h"
#import "CategoriesTableViewController.h"

@interface PeekPagedScrollViewController ()

@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;

@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) NSArray *durations;
@property (nonatomic, strong) NSArray *usages;
@property (nonatomic, strong) NSArray *descriptions;

- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;


@end

@implementation PeekPagedScrollViewController

@synthesize scrollView = _scrollView;

@synthesize pageImages = _pageImages;
@synthesize pageViews = _pageViews;

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    // Set up the image you want to scroll & zoom and add it to the scroll view
    self.pageImages = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"pic1.png"],
                       [UIImage imageNamed:@"pic2.png"],
                       [UIImage imageNamed:@"pic3.png"],
                       [UIImage imageNamed:@"pic4.png"],
                       [UIImage imageNamed:@"pic5.png"],
                       [UIImage imageNamed:@"pic6.png"],
                       [UIImage imageNamed:@"pic7.png"],
                       [UIImage imageNamed:@"pic8.png"],
                       nil];
    
    self.names = @[
                     @"Distraction",
                     @"Numbing Cream",
                     @"Regular Pain Medication",
                     @"As-Needed Pain Medication",
                     @"Mental Games",
                     @"Mental Relaxation",
                     @"Apply Heat",
                     @"Apply Cold"
                     ];
    
    self.durations = @[@"5 min. to 30 min.",
                       @"45 min. to 60 min.",
                       @"1 min.",
                       @"1 min.",
                       @"5 min. to 10 min.",
                       @"10 min.",
                       @"15 min. to 20 min.",
                       @"15 min. to 20 min."
                       ];
    
    self.usages = @[@"During Procedures, Headaches, Abdomen Pain, Muscle Pain",
                    @"Before Procedures",
                    @"Surgery, Headaches, Abdomen Pain",
                    @"Surgery, Headaches, Abdomen Pain",
                    @"During Procedures, Headaches, Abdomen Pain",
                    @"Surgeries, Headaches, Abdomen Pain, Muscle Pain",
                    @"Abdomen Pain, Muscle Pain",
                    @"Mouth Sores, Muscle Pain"
                    ];
    
    self.descriptions = @[@"By turning your attention to something else, you can block out unpleasant or stressful thoughts.",
                          @"Remember to apply pain numbing cream (topical anesthetic) 45-60 minutes before the procedure if your healthcare team has said it's okay.",
                          @"Make sure you are sticking to the medication schedule your doctor recommends. If taking your medications is difficult, you can speak to your pharmacist about useful options such as setting reminders on a cell phone or using post-it notes.",
                          @"If you doctor has given you a medication for break-through pain AND it is time to take it, consider taking it now. You can talk to your parents or healthcare team if you're not sure about when and how to take these medications.",
                          @"Mental games turn your attention away from pain and keep your mind busy with another activity. As a result, your mind isn't available to think about pain.",
                          @"Mental relaxation is an effective way to help you cope with pain and stress.",
                          @"Warm temperatures can help reduce pain. For instance, the warm temperatures of a hot pack can reduce muscle aches! Apply a hot pack to the area you are feeling pain. Remember not to apply heat to wounds or stitches.",
                          @"Cold temperatures can help reduce pain. For instance, the cold sensation from popsicles and ice chips can be really helpful for mouth sores! Apply a cold pack or other cold things like ice to the area you are feeling pain."
                          ];
    
    
    NSInteger pageCount = self.pageImages.count;
    
    self.scrollView.delegate = self;
    
    // Set up the page control
    // self.pageControl.currentPage = 0;
    // self.pageControl.numberOfPages = pageCount;
    
    // Set up the array to hold the views for each page
    self.pageViews = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < pageCount; ++i) {
        [self.pageViews addObject:[NSNull null]];
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    // Set up the content size of the scroll view
    CGSize pagesScrollViewSize = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * self.pageImages.count, pagesScrollViewSize.height);
    
    // Load the initial set of pages that are on screen
    [self loadVisiblePages];
    
    self.tabBarController.navigationItem.title = @"My Advice";
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Categories"
                                                                   style:UIBarButtonItemStylePlain target:self action:@selector(categoriesButtonPressed)];
    self.tabBarController.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Did it!"
                                                                    style:UIBarButtonItemStylePlain target:self action:@selector(didItButtonPressed)];
    self.tabBarController.navigationItem.rightBarButtonItem = rightButton;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadVisiblePages {
    // First, determine which page is currently visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((self.scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    // Update the page control
    //self.pageControl.currentPage = page;
    
    // Work out which pages you want to load
    NSInteger firstPage = page - 1;
    NSInteger lastPage = page + 1;
    
    // Purge anything before the first page
    for (NSInteger i=0; i<firstPage; i++) {
        [self purgePage:i];
    }
    for (NSInteger i=firstPage; i<=lastPage; i++) {
        [self loadPage:i];
    }
    for (NSInteger i=lastPage+1; i<self.pageImages.count; i++) {
        [self purgePage:i];
    }
    
    self.adviceName.text = [self.names objectAtIndex:page];
    self.durationLabel.text = [self.durations objectAtIndex:page];
    self.usageLabel.text = [self.usages objectAtIndex:page];
    self.adviceDescriptionTextView.text = [self.descriptions objectAtIndex:page];
}

- (void)loadPage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what we have to display, then do nothing
        return;
    }
    
    // Load an individual page, first checking if you've already loaded it
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView == [NSNull null]) {
        CGRect frame = self.scrollView.bounds;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0.0f;
        frame = CGRectInset(frame, 10.0f, 0.0f);
        
        UIImageView *newPageView = [[UIImageView alloc] initWithImage:[self.pageImages objectAtIndex:page]];
        
//        if (page == 4) {
//            newPageView = self.testImage;
//        }
        
        newPageView.contentMode = UIViewContentModeScaleAspectFit;
        newPageView.frame = frame;
        [self.scrollView addSubview:newPageView];
        
        [self.pageViews replaceObjectAtIndex:page withObject:newPageView];
    }
}

- (void)purgePage:(NSInteger)page {
    if (page < 0 || page >= self.pageImages.count) {
        // If it's outside the range of what you have to display, then do nothing
        return;
    }
    
    // Remove a page from the scroll view and reset the container array
    UIView *pageView = [self.pageViews objectAtIndex:page];
    if ((NSNull*)pageView != [NSNull null]) {
        [pageView removeFromSuperview];
        [self.pageViews replaceObjectAtIndex:page withObject:[NSNull null]];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // Load the pages that are now on screen
    [self loadVisiblePages];
    [self.scrollView setContentOffset: CGPointMake(self.scrollView.contentOffset.x, 0)];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    // Determine which table cell the scrolling will stop on.
    CGFloat cellHeight = 44.0f;
    NSInteger cellIndex = floor(targetContentOffset->x / cellHeight);
    
    // Round to the next cell if the scrolling will stop over halfway to the next cell.
    if ((targetContentOffset->x - (floor(targetContentOffset->x / cellHeight) * cellHeight)) > cellHeight) {
        cellIndex++;
    }
    
    // Adjust stopping point to exact beginning of cell.
    targetContentOffset->y = cellIndex * cellHeight;
    
    
    if (self.testImage.hidden == true) {
        self.testImage.hidden = false;
    } else {
        self.testImage.hidden = true;
    }
    
    

}

- (void)categoriesButtonPressed {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *nvc = [sb instantiateViewControllerWithIdentifier:@"CategoriesNavVC"];
    
    
    // CategoriesTableViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CategoriesTVC"];
    
    CategoriesTableViewController *vc = (CategoriesTableViewController *) [nvc.viewControllers objectAtIndex:0];
    vc.mode = 0;
    
    //    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)didItButtonPressed {

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My POP"
                                                                   message:@"Great Job!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
