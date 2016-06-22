//
//  PaperBook.h
//  Books
//
//  Created by Denis Aleksandrov on 6/16/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Book.h"

@interface PaperBook : Book

@property (assign)         float     shippingWeight;
@property (atomic, assign) BOOL      *InStock;
@property (assign)         NSInteger numberOfCopies;

-(instancetype)initWithTitle:(NSString*) _title andAuthor:(NSString*) _author andPrice:(float)_price andShippingWeight:(float) _shippingWeight andInStock:(BOOL) _InStock andNumberOfCopies:(NSInteger) _numberOfCopies;
-(void)decrementNumberOfCopies;

@end
