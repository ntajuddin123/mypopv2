//
//  SelectMultipleWithSliderViewController.h
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-20.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "BaseQuestionViewController.h"

@interface SelectMultipleWithSliderViewController : BaseQuestionViewController

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;

@property (strong, nonatomic) IBOutletCollection(UISlider) NSArray *sliders;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *labels;


@end
