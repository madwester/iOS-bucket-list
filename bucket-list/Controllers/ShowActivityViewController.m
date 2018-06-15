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

@synthesize titleLabel, descTextView, dateLabel, detailItem, titleActivity;

//creating a new item so we can handle each one
- (void)setDetailItem:(NSManagedObject *)newDetailItem {
    if (detailItem != newDetailItem) {
        //recieve the point to element
        detailItem = newDetailItem;
        NSLog(@"%@", [detailItem description]);
    }
}

- (void)configureView {
    
    // Update the user interface for the detail item.
    if (detailItem) {
        //extract element
        //valueForKeyPath = name from database
        [titleLabel setText:[NSString stringWithFormat:@"%@", [detailItem valueForKeyPath:@"listname"]]];
        [descTextView setText:[NSString stringWithFormat:@"%@", [detailItem valueForKeyPath:@"desc"]]];
        [dateLabel setText:[NSString stringWithFormat:@"%@", [detailItem valueForKeyPath:@"activityDate"]]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //setting the labels uneditable
    [titleLabel setUserInteractionEnabled:NO];
    [descTextView setUserInteractionEnabled:NO];
    [dateLabel setUserInteractionEnabled:NO];

    //hide tab bar
    self.tabBarController.tabBar.hidden = YES;
    
    //setting the title of the home page
    //self.navigationItem.title = @"Activity Detail";
    [self configureView];

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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"editBtn"]) {
        [[segue destinationViewController] setDetailItem:detailItem];
    }
    
}
//actions of edit btn
- (IBAction)editBtn:(id)sender {
    [self performSegueWithIdentifier:@"editBtn" sender:sender];
}
@end
