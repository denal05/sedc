//
//  Ebook.h
//  Books
//
//  Created by Denis Aleksandrov on 6/16/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Book.h"

@interface Ebook : Book

@property (atomic, copy) NSString  *downloadURL;
@property (assign)       NSInteger sizeMB;

-(instancetype)initWithTitle:(NSString*) _title andAuthor:(NSString*) _author andPrice:(float)_price andDownloadURL:(NSString*) _downloadURL andSizeMB:(NSInteger) _sizeMB;

@end
