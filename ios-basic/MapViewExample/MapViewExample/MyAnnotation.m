//
//  MyAnnotation.m
//  MapViewExample
//
//  Created by Denis Aleksandrov on 6/30/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize title, coordinate;

-(instancetype) initWithTitle:(NSString *)myTitle andCoordinate:(CLLocationCoordinate2D)myCoordinate
{
    self = [super init];
    
    if (self)
    {
        title = myTitle;
        coordinate = myCoordinate;
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
