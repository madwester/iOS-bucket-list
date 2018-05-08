//
//  ViewController.m
//  bucket-list
//
//  Created by Madeleine Westerstrom on 1/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewCell.h"
#import "AddActivityViewController.h"

//order for our table view to display data we need these
//delegate = when we click on something in the list
@interface ViewController () <UITableViewDataSource, UITabBarDelegate, AddActivityViewCrontrollerDelegate>

//creating an array so we can add new activities into it
@property (nonatomic, strong) NSMutableArray *activities;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //creating an empty array to my activity item
    self.activities = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.activities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"ListTableViewCell";
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //if it doesnt have a cell, we wanna create one from scratch and using default style
    if(nil == cell){
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: cellIdentifier];
    }
    NSString *activityText = self.activities[indexPath.row];
    cell.titleLabel.text = activityText;
    return cell;
}

//is gonna give me the segue way for the identifier we are given
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //getting an instance
    UINavigationController *nav = segue.destinationViewController;
    AddActivityViewController *addActivityVC = nav.viewControllers[0];
    addActivityVC.delegate = self;
}

-(void)savedNewActivity:(NSString *)activityText {
    [self.activities addObject:activityText];
    //reloading the table
    [self.tableView reloadData];
}

@end
