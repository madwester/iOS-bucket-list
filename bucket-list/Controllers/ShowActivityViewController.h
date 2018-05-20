//
//  ShowActivityViewController.h
//  bucket-list
//
//  Created by Madeleine Westerstrom on 20/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "ViewController.h"

@interface ShowActivityViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UITextView *dateTextView;
@property (weak, nonatomic) IBOutlet UITextView *descTextView;

@end
