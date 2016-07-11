//
//  Query.h
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Results;

@interface Query : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *created;
@property (nonatomic, strong) Results *results;
@property (nonatomic, assign) double count;
@property (nonatomic, strong) NSString *lang;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
