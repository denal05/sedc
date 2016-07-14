//
//  UILabel+TextColor.m
//  CategoriesInObjectiveC
//
//  Created by Denis Aleksandrov on 7/14/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "UILabel+TextColor.h"

@implementation UILabel (TextColor)

-(void)setTextColorRed
{
    [self setTextColor:[UIColor redColor]];
}

-(void)setDefaultText
{
    [self setText:@"Default"];
}

-(void)setDefaultSettings
{
    [self setDefaultText];
    [self setTextColor:[UIColor blueColor]];
}

@end
