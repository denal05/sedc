//
//  Circle.m
//  Hello World OSX Command Line App
//
//  Created by Denis Aleksandrov on 6/14/16.
//  Copyright © 2016 Denis Aleksandrov. All rights reserved.
//

#import "Circle.h"

@implementation Circle

-(instancetype)initWithRadius:(float)r
{
    self = [super init];
    
    if (self)
    {
        radius = r;
    }
    
    return self;
}

-(void)printRadius
{
    NSLog( @"Radius = %f", radius );
}

-(void)setRadius:(float)r andTheBeginningXCoordinate:(float)x
{
    radius = r;
}

@end
