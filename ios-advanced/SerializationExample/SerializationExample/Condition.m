//
//  Condition.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Condition.h"


NSString *const kConditionCode = @"code";
NSString *const kConditionText = @"text";
NSString *const kConditionTemp = @"temp";
NSString *const kConditionDate = @"date";


@interface Condition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Condition

@synthesize code = _code;
@synthesize text = _text;
@synthesize temp = _temp;
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
            self.code = [self objectOrNilForKey:kConditionCode fromDictionary:dict];
            self.text = [self objectOrNilForKey:kConditionText fromDictionary:dict];
            self.temp = [self objectOrNilForKey:kConditionTemp fromDictionary:dict];
            self.date = [self objectOrNilForKey:kConditionDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kConditionCode];
    [mutableDict setValue:self.text forKey:kConditionText];
    [mutableDict setValue:self.temp forKey:kConditionTemp];
    [mutableDict setValue:self.date forKey:kConditionDate];

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

    self.code = [aDecoder decodeObjectForKey:kConditionCode];
    self.text = [aDecoder decodeObjectForKey:kConditionText];
    self.temp = [aDecoder decodeObjectForKey:kConditionTemp];
    self.date = [aDecoder decodeObjectForKey:kConditionDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kConditionCode];
    [aCoder encodeObject:_text forKey:kConditionText];
    [aCoder encodeObject:_temp forKey:kConditionTemp];
    [aCoder encodeObject:_date forKey:kConditionDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    Condition *copy = [[Condition alloc] init];
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.temp = [self.temp copyWithZone:zone];
        copy.date = [self.date copyWithZone:zone];
    }
    
    return copy;
}


@end
