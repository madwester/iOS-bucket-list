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
    descTextView.text = @"Description";
}

//METHOD 1 OF 2 TO SET PLACEHOLDER
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"Description"]) {
        textView.text = @"";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView becomeFirstResponder];
}

//METHOD 2 OF 2 TO SET PLACEHOLDER
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"Description";
        textView.textColor = [UIColor lightGrayColor]; //optional
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

- (NSManagedObjectContext *) managedObjectContext {
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication] delegate];
    
    if([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)saveBtn:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSManagedObject *newActivity = [NSEntityDescription insertNewObjectForEntityForName:@"Activities" inManagedObjectContext:context];
    
    //formatting the date from datepicker to a string
    NSDate *date = datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:date];
    
    [newActivity setValue:titleTextField.text forKey:@"listname"];
    [newActivity setValue:descTextView.text forKey:@"desc"];
    [newActivity setValue:stringFromDate forKey:@"activityDate"];
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Your activity cannot be saved..%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
