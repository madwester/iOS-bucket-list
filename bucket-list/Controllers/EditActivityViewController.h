//
//  EditActivityViewController.h
//  bucket-list
//
//  Created by Madeleine Westerstrom on 5/6/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "ViewController.h"

@interface EditActivityViewController : UIViewController

//creating id to be able to pass data
@property (nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UITextField *editTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *editDescTextView;

- (IBAction)deleteBtn:(id)sender;


@end
