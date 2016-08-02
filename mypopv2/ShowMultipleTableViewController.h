//
//  ShowMultipleTableViewController.h
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-28.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartSurveyViewController.h"

@interface ShowMultipleTableViewController : UITableViewController

@property (nonatomic, strong) StartSurveyViewController *rootViewController;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *qtype;
@property NSUInteger qnumber;
@property (nonatomic, strong) NSString *skipQuestion;



@end
