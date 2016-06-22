//
//  Book.m
//  Books
//
//  Created by Denis Aleksandrov on 6/16/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Book.h"

@implementation Book

@synthesize title;
@synthesize author;
@synthesize price;

-(instancetype)initWithTitle:(NSString*) _title andAuthor:(NSString*) _author andPrice:(float)_price
{
    self = [super init];
    
    if (self)
    {
        [self setTitle:     _title];
        [self setAuthor:    _author];
        [self setPrice:     _price];
    }
    
    return self;
}

@end
