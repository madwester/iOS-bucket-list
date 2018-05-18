//
//  CustomTextView.m
//  bucket-list
//
//  Created by Madeleine Westerstrom on 18/5/18.
//  Copyright © 2018 Madeleine Westerstrom. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

-(void)addPlaceholderLabel:(NSSet *)objects
{
    self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 5.0, CGRectGetWidth(self.frame)-20.0, 20.0)];
    self.placeholderLabel.text = @"Testing setting placeholder in text";
    
    [self addSubview:self.placeholderLabel];
}


@end
