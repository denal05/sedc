//
//  Circle.m
//  Inheritance Example WIth Properties
//
//  Created by Denis Aleksandrov on 6/15/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Circle.h"

@implementation Circle
@synthesize radius;

-(instancetype)initWithX:(float)_x andWithY:(float)_y andWithRadius:(float)r
{
    self = [super initWithX:_x andWithY:_y];
    
    if (self)
    {
        [self setRadius:r];
    }
    
    return self;
}

-(void)printRadius
{
    NSLog( @"Radius = %f", radius );
}

-(void)setRadius:(float)r andTheBeginningXCoordinate:(float)x
{
    setRadius:r;
}

@end
