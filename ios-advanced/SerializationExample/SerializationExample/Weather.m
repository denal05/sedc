//
//  Weather.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Weather.h"
#import "Query.h"


NSString *const kWeatherQuery = @"query";


@interface Weather ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Weather

@synthesize query = _query;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.query = [Query modelObjectWithDictionary:[dict objectForKey:kWeatherQuery]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.query dictionaryRepresentation] forKey:kWeatherQuery];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.query = [aDecoder decodeObjectForKey:kWeatherQuery];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_query forKey:kWeatherQuery];
}

- (id)copyWithZone:(NSZone *)zone
{
    Weather *copy = [[Weather alloc] init];
    
    if (copy) {

        copy.query = [self.query copyWithZone:zone];
    }
    
    return copy;
}


@end
