//
//  ViewController.m
//  bucket-list
//
//  Created by Madeleine Westerstrom on 1/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "ViewController.h"
#import "ActivityDetailViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize activities;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setting the title of the home page
    self.navigationItem.title = @"Bucket List";
    
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
    
    NSFetchRequest *myFetch = [[NSFetchRequest alloc] initWithEntityName:@"Activities"];
    
    activities = [[_appDelegate.managedObjectContext executeFetchRequest:myFetch error:nil] mutableCopy];
    
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //pass data, to show correct activity
}


@end
