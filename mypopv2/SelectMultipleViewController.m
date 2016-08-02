//
//  SelectMultipleViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-19.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "SelectMultipleViewController.h"

@interface SelectMultipleViewController ()

@property (nonatomic, strong) NSArray *painTypes;
@property (nonatomic, strong) NSArray *otherStrategyTypes;
@property (nonatomic, strong) NSArray *types;

@end

@implementation SelectMultipleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.questionLabel setText:self.question];
    
    self.painTypes = @[@"Stabbing",
                       @"Gnawing",
                       @"Throbbing",
                       @"Shooting",
                       @"Sharp",
                       @"Cramping",
                       @"Itching",
                       @"Splitting"
                       ];

    self.otherStrategyTypes = @[@"Deep breathing",
                                @"Relaxation exercises",
                                @"Heat",
                                @"Cold",
                                @"Massage/rubbing",
                                @"Imagery",
                                @"Playing games",
                                @"Watching TV",
                                @"Talking with friends/family" ];

    
    
    // terrible hack - to fix
    if (self.qnumber < 7) {
        self.skipQuestion = [NSNull null];
    }
    
    if (self.qnumber > 5) {
        self.painTypes = self.otherStrategyTypes;
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Functions




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // return section == 0 ? self.painTypes.count : 2;
    return self.painTypes.count + 2;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TypeCell" forIndexPath:indexPath];
    
    if (indexPath.row < self.painTypes.count) {
        cell.textLabel.text = self.painTypes[indexPath.row];
    } else {
        //cell.textLabel.text = @"Other - double click to add";
        cell = [tableView dequeueReusableCellWithIdentifier:@"OtherCell" forIndexPath:indexPath];
        //self.inputText.text = @"Other - Click to add";
    }
    
    if (self.qnumber > 5) {
        
        if ((indexPath.row == 1) || (indexPath.row == 3)) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    }

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    //if (indexPath.row >= self.painTypes.count) return;
    
    
    if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
    } else {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
