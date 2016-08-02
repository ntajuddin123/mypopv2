//
//  PeekPagedScrollViewController.h
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-23.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeekPagedScrollViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *testImage;
@property (strong, nonatomic) IBOutlet UIView *detailView;


@property (strong, nonatomic) IBOutlet UILabel *adviceName;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *durationLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *usageLabel;

@property (unsafe_unretained, nonatomic) IBOutlet UITextView *adviceDescriptionTextView;

@end
