//
//  Book.h
//  Books
//
//  Created by Denis Aleksandrov on 6/16/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (atomic, copy) NSString *title;
@property (atomic, copy) NSString *author;
@property (atomic, assign) float price;

-(instancetype)initWithTitle:(NSString*) _title andAuthor:(NSString*) _author andPrice:(float)_price;

@end
