//
//  AddActivityViewController.h
//  bucket-list
//
//  Created by Madeleine Westerstrom on 8/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddActivityViewCrontrollerDelegate <NSObject>

-(void)savedNewActivity:(NSString *)activityText;

@end;

@interface AddActivityViewController : UIViewController

@property (nonatomic, strong) id <AddActivityViewCrontrollerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
