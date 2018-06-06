//
//  ShowActivityViewController.h
//  bucket-list
//
//  Created by Madeleine Westerstrom on 20/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "ViewController.h"
#import "EditActivityViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ShowActivityViewController : UIViewController

//creating id to be able to pass data
@property (strong, nonatomic) NSManagedObject *detailItem;

//elements from storyboard
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
- (IBAction)editBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *titleLabelTop;


@end
