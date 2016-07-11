//
//  Forecast.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Forecast.h"


NSString *const kForecastCode = @"code";
NSString *const kForecastLow = @"low";
NSString *const kForecastHigh = @"high";
NSString *const kForecastText = @"text";
NSString *const kForecastDay = @"day";
NSString *const kForecastDate = @"date";


@interface Forecast ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Forecast

@synthesize code = _code;
@synthesize low = _low;
@synthesize high = _high;
@synthesize text = _text;
@synthesize day = _day;
@synthesize date = _date;


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
            self.code = [self objectOrNilForKey:kForecastCode fromDictionary:dict];
            self.low = [self objectOrNilForKey:kForecastLow fromDictionary:dict];
            self.high = [self objectOrNilForKey:kForecastHigh fromDictionary:dict];
            self.text = [self objectOrNilForKey:kForecastText fromDictionary:dict];
            self.day = [self objectOrNilForKey:kForecastDay fromDictionary:dict];
            self.date = [self objectOrNilForKey:kForecastDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kForecastCode];
    [mutableDict setValue:self.low forKey:kForecastLow];
    [mutableDict setValue:self.high forKey:kForecastHigh];
    [mutableDict setValue:self.text forKey:kForecastText];
    [mutableDict setValue:self.day forKey:kForecastDay];
    [mutableDict setValue:self.date forKey:kForecastDate];

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

    self.code = [aDecoder decodeObjectForKey:kForecastCode];
    self.low = [aDecoder decodeObjectForKey:kForecastLow];
    self.high = [aDecoder decodeObjectForKey:kForecastHigh];
    self.text = [aDecoder decodeObjectForKey:kForecastText];
    self.day = [aDecoder decodeObjectForKey:kForecastDay];
    self.date = [aDecoder decodeObjectForKey:kForecastDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kForecastCode];
    [aCoder encodeObject:_low forKey:kForecastLow];
    [aCoder encodeObject:_high forKey:kForecastHigh];
    [aCoder encodeObject:_text forKey:kForecastText];
    [aCoder encodeObject:_day forKey:kForecastDay];
    [aCoder encodeObject:_date forKey:kForecastDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    Forecast *copy = [[Forecast alloc] init];
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.low = [self.low copyWithZone:zone];
        copy.high = [self.high copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.day = [self.day copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
    }
    
    return copy;
}


@end
