//
//  ViewController.m
//  bucket-list
//
//  Created by Madeleine Westerstrom on 1/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize activities;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setting the title of the home page
    self.navigationItem.title = @"Planned";
    
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
    
    //fetching activity so we can show them on screen if they are completed and active (not deleted)
    NSFetchRequest *myFetch = [[NSFetchRequest alloc] initWithEntityName:@"Activities"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat: @"completedActivity = YES && active = YES"];
    [myFetch setPredicate:predicate];
    
    activities = [[_appDelegate.managedObjectContext executeFetchRequest:myFetch error:nil] mutableCopy];
    
    [self.tableView reloadData];
}
//setting up table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//setting up each activity row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return activities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"ActivityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSManagedObject *activity = [activities objectAtIndex:indexPath.row];
    //setting the text to show in list
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [activity valueForKey:@"listname"]]];
    return cell;
}
//setting up identifier show detail
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [self performSegueWithIdentifier:@"showDetail" sender:self];
}


- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark - Segues
//padding data to next screen when clicked on activity
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSData *activity = self.activities[indexPath.row];
        [[segue destinationViewController] setDetailItem:activity];
    }
    
}



@end
