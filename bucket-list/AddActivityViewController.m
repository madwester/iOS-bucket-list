//
//  AddActivityViewController.m
//  bucket-list
//
//  Created by Madeleine Westerstrom on 8/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "AddActivityViewController.h"

@interface AddActivityViewController ()

@end

@implementation AddActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender {
    [self.delegate savedNewActivity:self.textField.text];
    [self dismissViewControllerAnimated:(YES) completion:nil];
}
//get data and pass back to populate it
- (IBAction)save:(id)sender {
    [self dismissViewControllerAnimated:(YES) completion:nil];
}
@end
