//
//  UITextView+TextColorSpaces.m
//  CategoriesInObjectiveC
//
//  Created by Denis Aleksandrov on 7/14/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "UITextView+TextColorSpaces.h"

@implementation UITextView (TextColorSpaces)

-(void)removeSpaces
{
    NSString *buffer = [[NSString alloc] init];
    buffer = [self.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    [self setText:buffer];
}

-(void)setRandomColor
{
    UIColor *randomColor = [UIColor colorWithRed:(arc4random()%10)/10. green:(arc4random()%10)/10. blue:(arc4random()%10)/10. alpha:1.0];
    // alpha:(arc4random()%10+1)/10.
    [self setTextColor:randomColor];
}

@end
