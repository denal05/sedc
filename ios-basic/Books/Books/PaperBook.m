//
//  PaperBook.m
//  Books
//
//  Created by Denis Aleksandrov on 6/16/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "PaperBook.h"

@implementation PaperBook

@synthesize shippingWeight;
@synthesize InStock;
@synthesize numberOfCopies;

-(instancetype)initWithTitle:(NSString*) _title andAuthor:(NSString*) _author andPrice:(float)_price andShippingWeight:(float) _shippingWeight andInStock:(BOOL) _InStock andNumberOfCopies:(NSInteger) _numberOfCopies
{
    self = [super initWithTitle:_title andAuthor:_author andPrice:_price];
    
    if (self)
    {
        [self setShippingWeight:   _shippingWeight];
        [self setInStock:          &_InStock];
        [self setNumberOfCopies:   _numberOfCopies];
    }
    
    return self;
}

-(void)decrementNumberOfCopies
{
    if (self)
    {
        if ((numberOfCopies-1) < 0)
        {
            [self setNumberOfCopies: 0];
        }
        else
        {
            [self setNumberOfCopies: (numberOfCopies-1)];
        }
    }
}

@end
