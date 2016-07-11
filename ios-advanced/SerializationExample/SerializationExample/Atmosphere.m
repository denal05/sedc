//
//  Atmosphere.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Atmosphere.h"


NSString *const kAtmosphereHumidity = @"humidity";
NSString *const kAtmosphereVisibility = @"visibility";
NSString *const kAtmospherePressure = @"pressure";
NSString *const kAtmosphereRising = @"rising";


@interface Atmosphere ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Atmosphere

@synthesize humidity = _humidity;
@synthesize visibility = _visibility;
@synthesize pressure = _pressure;
@synthesize rising = _rising;


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
            self.humidity = [self objectOrNilForKey:kAtmosphereHumidity fromDictionary:dict];
            self.visibility = [self objectOrNilForKey:kAtmosphereVisibility fromDictionary:dict];
            self.pressure = [self objectOrNilForKey:kAtmospherePressure fromDictionary:dict];
            self.rising = [self objectOrNilForKey:kAtmosphereRising fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.humidity forKey:kAtmosphereHumidity];
    [mutableDict setValue:self.visibility forKey:kAtmosphereVisibility];
    [mutableDict setValue:self.pressure forKey:kAtmospherePressure];
    [mutableDict setValue:self.rising forKey:kAtmosphereRising];

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

    self.humidity = [aDecoder decodeObjectForKey:kAtmosphereHumidity];
    self.visibility = [aDecoder decodeObjectForKey:kAtmosphereVisibility];
    self.pressure = [aDecoder decodeObjectForKey:kAtmospherePressure];
    self.rising = [aDecoder decodeObjectForKey:kAtmosphereRising];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_humidity forKey:kAtmosphereHumidity];
    [aCoder encodeObject:_visibility forKey:kAtmosphereVisibility];
    [aCoder encodeObject:_pressure forKey:kAtmospherePressure];
    [aCoder encodeObject:_rising forKey:kAtmosphereRising];
}

- (id)copyWithZone:(NSZone *)zone
{
    Atmosphere *copy = [[Atmosphere alloc] init];
    
    if (copy) {

        copy.humidity = [self.humidity copyWithZone:zone];
        copy.visibility = [self.visibility copyWithZone:zone];
        copy.pressure = [self.pressure copyWithZone:zone];
        copy.rising = [self.rising copyWithZone:zone];
    }
    
    return copy;
}


@end
