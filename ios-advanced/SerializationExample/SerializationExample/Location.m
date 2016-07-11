//
//  Location.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Location.h"


NSString *const kLocationCountry = @"country";
NSString *const kLocationCity = @"city";
NSString *const kLocationRegion = @"region";


@interface Location ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Location

@synthesize country = _country;
@synthesize city = _city;
@synthesize region = _region;


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
            self.country = [self objectOrNilForKey:kLocationCountry fromDictionary:dict];
            self.city = [self objectOrNilForKey:kLocationCity fromDictionary:dict];
            self.region = [self objectOrNilForKey:kLocationRegion fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.country forKey:kLocationCountry];
    [mutableDict setValue:self.city forKey:kLocationCity];
    [mutableDict setValue:self.region forKey:kLocationRegion];

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

    self.country = [aDecoder decodeObjectForKey:kLocationCountry];
    self.city = [aDecoder decodeObjectForKey:kLocationCity];
    self.region = [aDecoder decodeObjectForKey:kLocationRegion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_country forKey:kLocationCountry];
    [aCoder encodeObject:_city forKey:kLocationCity];
    [aCoder encodeObject:_region forKey:kLocationRegion];
}

- (id)copyWithZone:(NSZone *)zone
{
    Location *copy = [[Location alloc] init];
    
    if (copy) {

        copy.country = [self.country copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.region = [self.region copyWithZone:zone];
    }
    
    return copy;
}


@end
