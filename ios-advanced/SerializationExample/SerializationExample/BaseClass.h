//
//  BaseClass.h
//
//  Created by Dejan Krstevski on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Query;

@interface BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Query *query;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
