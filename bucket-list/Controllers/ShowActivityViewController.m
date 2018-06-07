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

@synthesize titleLabel, descTextView, dateLabel, detailItem;


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
    
    [titleLabel setUserInteractionEnabled:NO];
    [descTextView setUserInteractionEnabled:NO];
    [dateLabel setUserInteractionEnabled:NO];

    //hide tab bar
    self.tabBarController.tabBar.hidden = YES;
    
    //setting the title of the home page
    //self.navigationItem.title = @"Activity Detail";
    [self configureView];

    /*
    border-bottom on label
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderColor = [UIColor blackColor].CGColor;
    bottomBorder.borderWidth = 1;
    bottomBorder.frame = CGRectMake(0, CGRectGetHeight(titleLabelTop.frame)-1, CGRectGetWidth(titleLabelTop.frame), 1);
    titleLabelTop.clipsToBounds = YES;
    [titleLabelTop.layer addSublayer:bottomBorder];
    */

    
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if(self) {
        [self configureView];
    }
    //making description label multilined
    //descLabel.lineBreakMode = NSLineBreakByWordWrapping;
    //descLabel.numberOfLines = 0;
    //[descLabel sizeToFit];
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

- (IBAction)editBtn:(id)sender {
    [self performSegueWithIdentifier:@"editBtn" sender:sender];
}
@end
