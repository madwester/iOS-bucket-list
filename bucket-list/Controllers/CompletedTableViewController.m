//
//  CompletedTableViewController.m
//  bucket-list
//
//  Created by Madeleine Westerstrom on 18/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "CompletedTableViewController.h"

@interface CompletedTableViewController ()

@end

@implementation CompletedTableViewController

@synthesize activities;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setting the title of the home page
    self.navigationItem.title = @"Completed";
    
    _appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewWillAppear:(BOOL)animated {
    //show tab bar
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //fetching activities from local database
    NSFetchRequest *myFetch = [[NSFetchRequest alloc] initWithEntityName:@"Activities"];
    
    //filtering away deleted and planned activities
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"completedActivity = NO && active = YES"];
    [myFetch setPredicate:predicate];
    
    activities = [[_appDelegate.managedObjectContext executeFetchRequest:myFetch error:nil] mutableCopy];
    
    //reloading table view
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//returning as many rows as exisiting activities
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return activities.count;
}

//setting up each activity as a label
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"CompleteActivityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //wrapping each activity into a object
    NSManagedObject *activity = [activities objectAtIndex:indexPath.row];
    //setting the text to show in list
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [activity valueForKey:@"listname"]]];
    return cell;
}

//setting up clickevent when clicking on activity
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

//managing object
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark - Segues
//passing data of acticity into next screen
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSData *activity = self.activities[indexPath.row];
        [[segue destinationViewController] setDetailItem:activity];
    }
    
}
@end
