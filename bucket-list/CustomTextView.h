//
//  CustomTextView.h
//  bucket-list
//
//  Created by Madeleine Westerstrom on 18/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTextView : UITextView <UITextViewDelegate>

@property (nonatomic, strong) UILabel *placeholderLabel;

@end
