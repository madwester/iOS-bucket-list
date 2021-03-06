//
//  EditActivityViewController.h
//  bucket-list
//
//  Created by Madeleine Westerstrom on 5/6/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EditActivityViewController : UIViewController

//creating id to be able to pass data
@property (strong, nonatomic) NSManagedObject *detailItem;
@property (weak, nonatomic) IBOutlet UITextField *editTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *editDescTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *editDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *completedBtnOutlet;
@property (weak, nonatomic) IBOutlet UIButton *plannedBtnOutlet;

- (IBAction)deleteBtn:(id)sender;
- (IBAction)saveEditBtn:(id)sender;
- (IBAction)completedBtn:(id)sender;
- (IBAction)plannedBtn:(id)sender;

@end
