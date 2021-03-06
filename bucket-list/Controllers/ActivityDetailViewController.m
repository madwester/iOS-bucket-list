//
//  ActivityDetailViewController.m
//  bucket-list
//
//  Created by Madeleine Westerstrom on 9/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "ViewController.h"

@interface ActivityDetailViewController ()

@end

@implementation ActivityDetailViewController

@synthesize titleTextField, descTextView, datePicker;

//only loads one
- (void)viewDidLoad{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //hide tab bar 
    self.tabBarController.tabBar.hidden = YES;
    
    //setting the title
    self.navigationItem.title = @"Add New Activity";
    
    //setting placeholder for description textview
    self.descTextView.delegate = self;
    descTextView.text = @"Add your Description";
    descTextView.textColor = [UIColor lightGrayColor];
    
    //adding padding to textfield
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    titleTextField.leftView = paddingView;
    titleTextField.leftViewMode = UITextFieldViewModeAlways;
}

//METHOD 1 OF 2 TO SET PLACEHOLDER
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Add your Description"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

//METHOD 2 OF 2 TO SET PLACEHOLDER
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Add your Description";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView resignFirstResponder];
}

/*
//loads more than once, example if I need placeholders
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//managing the object og
- (NSManagedObjectContext *) managedObjectContext {
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
//actions for save button
- (IBAction)saveBtn:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    //wrapping activity into an objecy
    NSManagedObject *newActivity = [NSEntityDescription insertNewObjectForEntityForName:@"Activities" inManagedObjectContext:context];
    
    //formatting the date from datepicker to a string
    NSDate *date = datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:date];
    
    //setting values of activity into db
    [newActivity setValue:titleTextField.text forKey:@"listname"];
    [newActivity setValue:descTextView.text forKey:@"desc"];
    [newActivity setValue:stringFromDate forKey:@"activityDate"];
    [newActivity setValue:[NSNumber numberWithBool:YES] forKey:@"active"];
    [newActivity setValue:[NSNumber numberWithBool:YES] forKey:@"completedActivity"];
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Your activity cannot be saved..%@ %@", error, [error localizedDescription]);
    }
    //redirecting user
    [self.navigationController popViewControllerAnimated:YES];
}

@end
