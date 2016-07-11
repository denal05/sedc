//
//  Astronomy.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Astronomy.h"


NSString *const kAstronomySunrise = @"sunrise";
NSString *const kAstronomySunset = @"sunset";


@interface Astronomy ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Astronomy

@synthesize sunrise = _sunrise;
@synthesize sunset = _sunset;


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
            self.sunrise = [self objectOrNilForKey:kAstronomySunrise fromDictionary:dict];
            self.sunset = [self objectOrNilForKey:kAstronomySunset fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sunrise forKey:kAstronomySunrise];
    [mutableDict setValue:self.sunset forKey:kAstronomySunset];

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

    self.sunrise = [aDecoder decodeObjectForKey:kAstronomySunrise];
    self.sunset = [aDecoder decodeObjectForKey:kAstronomySunset];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sunrise forKey:kAstronomySunrise];
    [aCoder encodeObject:_sunset forKey:kAstronomySunset];
}

- (id)copyWithZone:(NSZone *)zone
{
    Astronomy *copy = [[Astronomy alloc] init];
    
    if (copy) {

        copy.sunrise = [self.sunrise copyWithZone:zone];
        copy.sunset = [self.sunset copyWithZone:zone];
    }
    
    return copy;
}


@end
