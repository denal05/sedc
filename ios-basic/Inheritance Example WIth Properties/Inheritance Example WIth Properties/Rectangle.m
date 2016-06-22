//
//  Rectangle.m
//  Inheritance Example WIth Properties
//
//  Created by Denis Aleksandrov on 6/15/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
@synthesize width;
@synthesize height;

-(instancetype)initWithWidth:(float)_w andWithHeight:(float)_h andWithX:(float)_x andWithY:(float)_y
{
    self = [super initWithX:_x andWithY:_y];
    
    if (self)
    {
        [self setWidth:_w];
        [self setHeight:_h];
    }
    
    return self;

}

@end
