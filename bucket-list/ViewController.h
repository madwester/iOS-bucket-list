//
//  ViewController.h
//  bucket-list
//
//  Created by Madeleine Westerstrom on 1/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ActivityDetailViewController.h" //edit activity page
#import "ShowActivityViewController.h" //show acticity page
@import CoreData;

@interface ViewController : UITableViewController

@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSMutableArray *activities;

@end

