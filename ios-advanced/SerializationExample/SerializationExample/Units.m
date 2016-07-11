//
//  Units.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Units.h"


NSString *const kUnitsTemperature = @"temperature";
NSString *const kUnitsSpeed = @"speed";
NSString *const kUnitsPressure = @"pressure";
NSString *const kUnitsDistance = @"distance";


@interface Units ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Units

@synthesize temperature = _temperature;
@synthesize speed = _speed;
@synthesize pressure = _pressure;
@synthesize distance = _distance;


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
            self.temperature = [self objectOrNilForKey:kUnitsTemperature fromDictionary:dict];
            self.speed = [self objectOrNilForKey:kUnitsSpeed fromDictionary:dict];
            self.pressure = [self objectOrNilForKey:kUnitsPressure fromDictionary:dict];
            self.distance = [self objectOrNilForKey:kUnitsDistance fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.temperature forKey:kUnitsTemperature];
    [mutableDict setValue:self.speed forKey:kUnitsSpeed];
    [mutableDict setValue:self.pressure forKey:kUnitsPressure];
    [mutableDict setValue:self.distance forKey:kUnitsDistance];

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

    self.temperature = [aDecoder decodeObjectForKey:kUnitsTemperature];
    self.speed = [aDecoder decodeObjectForKey:kUnitsSpeed];
    self.pressure = [aDecoder decodeObjectForKey:kUnitsPressure];
    self.distance = [aDecoder decodeObjectForKey:kUnitsDistance];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_temperature forKey:kUnitsTemperature];
    [aCoder encodeObject:_speed forKey:kUnitsSpeed];
    [aCoder encodeObject:_pressure forKey:kUnitsPressure];
    [aCoder encodeObject:_distance forKey:kUnitsDistance];
}

- (id)copyWithZone:(NSZone *)zone
{
    Units *copy = [[Units alloc] init];
    
    if (copy) {

        copy.temperature = [self.temperature copyWithZone:zone];
        copy.speed = [self.speed copyWithZone:zone];
        copy.pressure = [self.pressure copyWithZone:zone];
        copy.distance = [self.distance copyWithZone:zone];
    }
    
    return copy;
}


@end
