//
//  ShowActivityViewController.m
//  bucket-list
//
//  Created by Madeleine Westerstrom on 20/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "ShowActivityViewController.h"

@interface ShowActivityViewController ()

@end

@implementation ShowActivityViewController

@synthesize titleLabel, dateLabel, descLabel, detailItem;

- (void)setDetailItem:(NSManagedObject *)newDetailItem {
    if (detailItem != newDetailItem) {
        
        //recieve the point to element
        detailItem = newDetailItem;
        NSLog(@"%@", [detailItem description]);
        // Update the view.
        //[self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (detailItem) {
        //extract element
        //valueForKeyPath = name from database
        [titleLabel setText:[NSString stringWithFormat:@"%@",[detailItem valueForKeyPath:@"listname"]]];
        [descLabel setText:[NSString stringWithFormat:@"%@", [detailItem valueForKeyPath:@"desc"]]];
        [dateLabel setText:[NSString stringWithFormat:@"%@", [detailItem valueForKeyPath:@"activityDate"]]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //hide tab bar
    self.tabBarController.tabBar.hidden = YES;
    
    //setting the title of the home page
    self.navigationItem.title = @"Activity Detail";
    [self configureView];
    
    //making description label multilined
    descLabel.lineBreakMode = NSLineBreakByWordWrapping;
    descLabel.numberOfLines = 0;

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if(self) {
        [self configureView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"editBtn"]) {
        [[segue destinationViewController] setDetailItem:detailItem];
    }
    
}


- (IBAction)editBtn:(id)sender {
    [self performSegueWithIdentifier:@"editBtn" sender:sender];
}
@end
