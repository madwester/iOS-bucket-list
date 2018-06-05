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

@synthesize editTitleTextField, editDescTextView, detailItem;

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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //hide tab bar
    self.tabBarController.tabBar.hidden = YES;
    
    //setting the title of the home page
    self.navigationItem.title = @"Activity Detail";
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
}

- (IBAction)deleteBtn:(id)sender {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    [detailItem setValue:[NSNumber numberWithBool:NO] forKey:@"active"];
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Your activity cannot be deleted..%@ %@", error, [error localizedDescription]);
    }

    
}


@end
