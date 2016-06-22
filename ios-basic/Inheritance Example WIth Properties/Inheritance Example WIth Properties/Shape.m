//
//  Shape.m
//  Inheritance Example WIth Properties
//
//  Created by Denis Aleksandrov on 6/15/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Shape.h"

@implementation Shape
@synthesize x;
@synthesize y;

-(instancetype)initWithX:(float)_x andWithY:(float)_y
{
    self = [super init];
    
    if (self)
    {
        [self setX:_x];
        [self setY:_y];
    }
    
    return self;
}

-(void)setXY:(float)newX andNewY:(float)Y
{
    
}

-(void)printCoordinates
{
    
}

@end
