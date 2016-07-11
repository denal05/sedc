//
//  Item.h
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Condition, Guid;

@interface Item : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *itemDescription;
@property (nonatomic, strong) Condition *condition;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *pubDate;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) Guid *guid;
@property (nonatomic, strong) NSArray *forecast;
@property (nonatomic, strong) NSString *longProperty;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
