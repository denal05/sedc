//
//  Channel.h
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item, Units, Wind, Location, Image, Atmosphere, Astronomy;

@interface Channel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *channelDescription;
@property (nonatomic, strong) NSString *ttl;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) Item *item;
@property (nonatomic, strong) Units *units;
@property (nonatomic, strong) Wind *wind;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) Location *location;
@property (nonatomic, strong) Image *image;
@property (nonatomic, strong) NSString *lastBuildDate;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) Atmosphere *atmosphere;
@property (nonatomic, strong) Astronomy *astronomy;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
