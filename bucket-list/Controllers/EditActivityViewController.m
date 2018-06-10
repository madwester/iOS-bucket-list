//
//  EditActivityViewController.m
//  bucket-list
//
//  Created by Madeleine Westerstrom on 5/6/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "EditActivityViewController.h"

@interface EditActivityViewController ()

@end

@implementation EditActivityViewController

@synthesize editTitleTextField, editDescTextView, editDatePicker, detailItem, completedBtnOutlet, plannedBtnOutlet;

- (void)setDetailItem:(NSManagedObject *)newDetailItem {
    if (detailItem != newDetailItem) {
        
        //recieve the point to element
        detailItem = newDetailItem;
        NSLog(@"%@", [detailItem description]);
        // Update the view.
        //[self configureView];
    }
}
- (void)configureView {
    // Update the user interface for the detail item.
    if (detailItem) {
        //extract element
        //valueForKeyPath = name from database
        [editTitleTextField setText:[NSString stringWithFormat:@"%@",[detailItem valueForKeyPath:@"listname"]]];
        [editDescTextView setText:[NSString stringWithFormat:@"%@", [detailItem valueForKeyPath:@"desc"]]];
    }
    
    //enabling button if current activity already is completed
    if([[NSString stringWithFormat:@"%@",[detailItem valueForKey:@"completedActivity"]]  isEqual: @"1"]) {
        completedBtnOutlet.hidden = NO;
        plannedBtnOutlet.hidden = YES;
    }
    else{
        completedBtnOutlet.hidden = YES;
        plannedBtnOutlet.hidden = NO;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //hide tab bar
    self.tabBarController.tabBar.hidden = YES;
    
    //adding padding to textfield
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    editTitleTextField.leftView = paddingView;
    editTitleTextField.leftViewMode = UITextFieldViewModeAlways;
    
    //setting the title of the home page
    //self.navigationItem.title = @"Activity Detail";
    [self configureView];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if(self)
    {
        [self configureView];
    }
}

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

- (IBAction)completedBtn:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    [detailItem setValue:[NSNumber numberWithBool:NO] forKey:@"completedActivity"];
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Your activity cannot be saved..%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)plannedBtn:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    [detailItem setValue:[NSNumber numberWithBool:YES] forKey:@"completedActivity"];
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Your activity cannot be saved..%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)deleteBtn:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    [detailItem setValue:[NSNumber numberWithBool:NO] forKey:@"active"];
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Your activity cannot be deleted..%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)saveEditBtn:(id)sender {
    
    //formatting the date from datepicker to a string
    NSDate *date = editDatePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:date];
    
    NSManagedObjectContext *context = [self managedObjectContext];
    [detailItem setValue:editTitleTextField.text forKey:@"listname"];
    [detailItem setValue:editDescTextView.text forKey:@"desc"];
    [detailItem setValue:stringFromDate forKey:@"activityDate"];
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Your activity cannot be updated..%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

