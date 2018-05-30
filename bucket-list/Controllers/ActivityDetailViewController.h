//
//  ActivityDetailViewController.h
//  bucket-list
//
//  Created by Madeleine Westerstrom on 9/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ActivityDetailViewController : UIViewController <UITextViewDelegate>

//initializing textfields and buttons
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;
- (IBAction)saveBtn:(id)sender;



@end
