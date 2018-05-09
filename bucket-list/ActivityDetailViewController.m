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

@synthesize titleTextField, descTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
    
    [newDevice setValue:titleTextField.text forKey:@"name"];
    [newDevice setValue:descTextField.text forKey:@"desc"];
    
    NSError *error = nil;
    if(![context save:&error]){
        NSLog(@"Your activity cannot be saved..%@ %@", error, [error localizedDescription]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
