//
//  ViewController.h
//  bucket-list
//
//  Created by Madeleine Westerstrom on 1/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreData;

@interface ViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *activities;
@property (strong, nonatomic) NSMutableArray *devices;

@end

