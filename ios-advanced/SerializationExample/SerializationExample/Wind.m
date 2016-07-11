//
//  Wind.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Wind.h"


NSString *const kWindChill = @"chill";
NSString *const kWindDirection = @"direction";
NSString *const kWindSpeed = @"speed";


@interface Wind ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Wind

@synthesize chill = _chill;
@synthesize direction = _direction;
@synthesize speed = _speed;


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
            self.chill = [self objectOrNilForKey:kWindChill fromDictionary:dict];
            self.direction = [self objectOrNilForKey:kWindDirection fromDictionary:dict];
            self.speed = [self objectOrNilForKey:kWindSpeed fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.chill forKey:kWindChill];
    [mutableDict setValue:self.direction forKey:kWindDirection];
    [mutableDict setValue:self.speed forKey:kWindSpeed];

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

    self.chill = [aDecoder decodeObjectForKey:kWindChill];
    self.direction = [aDecoder decodeObjectForKey:kWindDirection];
    self.speed = [aDecoder decodeObjectForKey:kWindSpeed];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_chill forKey:kWindChill];
    [aCoder encodeObject:_direction forKey:kWindDirection];
    [aCoder encodeObject:_speed forKey:kWindSpeed];
}

- (id)copyWithZone:(NSZone *)zone
{
    Wind *copy = [[Wind alloc] init];
    
    if (copy) {

        copy.chill = [self.chill copyWithZone:zone];
        copy.direction = [self.direction copyWithZone:zone];
        copy.speed = [self.speed copyWithZone:zone];
    }
    
    return copy;
}


@end
