//
//  Ebook.m
//  Books
//
//  Created by Denis Aleksandrov on 6/16/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Ebook.h"

@implementation Ebook

@synthesize downloadURL;
@synthesize sizeMB;

-(instancetype)initWithTitle:(NSString*) _title andAuthor:(NSString*) _author andPrice:(float)_price andDownloadURL:(NSString*) _downloadURL andSizeMB:(NSInteger) _sizeMB
{
    self = [super initWithTitle:_title andAuthor:_author andPrice:_price];

    if (self)
    {
        [self setDownloadURL:   _downloadURL];
        [self setSizeMB:        _sizeMB];
    }
    
    return self;
}

@end
