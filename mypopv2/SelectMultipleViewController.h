//
//  SelectMultipleViewController.h
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-19.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseQuestionViewController.h"

@interface SelectMultipleViewController : BaseQuestionViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@end
