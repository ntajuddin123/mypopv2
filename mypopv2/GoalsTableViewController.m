//
//  GoalsTableViewController.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-26.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "GoalsTableViewController.h"
#import "CategoriesTableViewController.h"

@interface GoalsTableViewController ()

@property (nonatomic, strong) NSArray *allGoals;
@property (nonatomic, strong) NSArray *goalTypes;
@property (nonatomic, strong) NSMutableArray *selectedGoals;


@end

@implementation GoalsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(65,0,0,0);
    
    self.allGoals = @[@"Go for a walk",
                      @"Take the stairs",
                      @"Avoid caffeine before bed",
                      @"Get 8 hours of sleep",
                      @"Meet with a friend this week",
                      @"Go to the mall",
                      @"Focus on balanced thoughts",
                      @"Do something to help someone else",
                      @"Stretch in the morning"
                      ];
    
    self.goalTypes = @[@"Physical - Two more times this week",
                       @"Physical",
                       @"Sleep",
                       @"Sleep",
                       @"Social",
                       @"Social - Accomplished!",
                       @"Mindfulness",
                       @"Mindfulness",
                       @"Physical"
                       ];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {

    self.tabBarController.navigationItem.title = @"My Goals";
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Categories"
                                                                   style:UIBarButtonItemStylePlain target:self action:@selector(categoriesButtonPressed)];
    self.tabBarController.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Progress"
                                                                   style:UIBarButtonItemStylePlain target:self action:@selector(progressButtonPressed)];
    self.tabBarController.navigationItem.rightBarButtonItem = rightButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.allGoals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoalCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.allGoals objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.goalTypes objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"green-check.png"];
    
    cell.imageView.userInteractionEnabled = YES;
    cell.imageView.tag = indexPath.row;
    
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didItButtonPressed)];
    tapped.numberOfTapsRequired = 1;
    [cell.imageView addGestureRecognizer:tapped];
    
    
    
    return cell;
}

#pragma mark - Private functions

- (void)categoriesButtonPressed {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *nvc = [sb instantiateViewControllerWithIdentifier:@"CategoriesNavVC"];
    
    CategoriesTableViewController *vc = (CategoriesTableViewController *) [nvc.viewControllers objectAtIndex:0];
    vc.mode = 1;

    
 //   CategoriesTableViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CategoriesTVC"];
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:nvc animated:YES completion:nil];
}

- (void)progressButtonPressed {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *nvc = [sb instantiateViewControllerWithIdentifier:@"GoalsProgressNavVC"];
    
    
   // GoalsProgressViewController *vc = [sb instantiateViewControllerWithIdentifier:@"GoalsProgressVC"];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
