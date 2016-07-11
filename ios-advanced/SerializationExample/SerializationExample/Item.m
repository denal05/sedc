//
//  Item.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Item.h"
#import "Condition.h"
#import "Guid.h"
#import "Forecast.h"


NSString *const kItemDescription = @"description";
NSString *const kItemCondition = @"condition";
NSString *const kItemTitle = @"title";
NSString *const kItemLink = @"link";
NSString *const kItemPubDate = @"pubDate";
NSString *const kItemLat = @"lat";
NSString *const kItemGuid = @"guid";
NSString *const kItemForecast = @"forecast";
NSString *const kItemLong = @"long";


@interface Item ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Item

@synthesize itemDescription = _itemDescription;
@synthesize condition = _condition;
@synthesize title = _title;
@synthesize link = _link;
@synthesize pubDate = _pubDate;
@synthesize lat = _lat;
@synthesize guid = _guid;
@synthesize forecast = _forecast;
@synthesize longProperty = _longProperty;


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
            self.itemDescription = [self objectOrNilForKey:kItemDescription fromDictionary:dict];
            self.condition = [Condition modelObjectWithDictionary:[dict objectForKey:kItemCondition]];
            self.title = [self objectOrNilForKey:kItemTitle fromDictionary:dict];
            self.link = [self objectOrNilForKey:kItemLink fromDictionary:dict];
            self.pubDate = [self objectOrNilForKey:kItemPubDate fromDictionary:dict];
            self.lat = [self objectOrNilForKey:kItemLat fromDictionary:dict];
            self.guid = [Guid modelObjectWithDictionary:[dict objectForKey:kItemGuid]];
    NSObject *receivedForecast = [dict objectForKey:kItemForecast];
    NSMutableArray *parsedForecast = [NSMutableArray array];
    if ([receivedForecast isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedForecast) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedForecast addObject:[Forecast modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedForecast isKindOfClass:[NSDictionary class]]) {
       [parsedForecast addObject:[Forecast modelObjectWithDictionary:(NSDictionary *)receivedForecast]];
    }

    self.forecast = [NSArray arrayWithArray:parsedForecast];
            self.longProperty = [self objectOrNilForKey:kItemLong fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.itemDescription forKey:kItemDescription];
    [mutableDict setValue:[self.condition dictionaryRepresentation] forKey:kItemCondition];
    [mutableDict setValue:self.title forKey:kItemTitle];
    [mutableDict setValue:self.link forKey:kItemLink];
    [mutableDict setValue:self.pubDate forKey:kItemPubDate];
    [mutableDict setValue:self.lat forKey:kItemLat];
    [mutableDict setValue:[self.guid dictionaryRepresentation] forKey:kItemGuid];
    NSMutableArray *tempArrayForForecast = [NSMutableArray array];
    for (NSObject *subArrayObject in self.forecast) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForForecast addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForForecast addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForForecast] forKey:kItemForecast];
    [mutableDict setValue:self.longProperty forKey:kItemLong];

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

    self.itemDescription = [aDecoder decodeObjectForKey:kItemDescription];
    self.condition = [aDecoder decodeObjectForKey:kItemCondition];
    self.title = [aDecoder decodeObjectForKey:kItemTitle];
    self.link = [aDecoder decodeObjectForKey:kItemLink];
    self.pubDate = [aDecoder decodeObjectForKey:kItemPubDate];
    self.lat = [aDecoder decodeObjectForKey:kItemLat];
    self.guid = [aDecoder decodeObjectForKey:kItemGuid];
    self.forecast = [aDecoder decodeObjectForKey:kItemForecast];
    self.longProperty = [aDecoder decodeObjectForKey:kItemLong];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_itemDescription forKey:kItemDescription];
    [aCoder encodeObject:_condition forKey:kItemCondition];
    [aCoder encodeObject:_title forKey:kItemTitle];
    [aCoder encodeObject:_link forKey:kItemLink];
    [aCoder encodeObject:_pubDate forKey:kItemPubDate];
    [aCoder encodeObject:_lat forKey:kItemLat];
    [aCoder encodeObject:_guid forKey:kItemGuid];
    [aCoder encodeObject:_forecast forKey:kItemForecast];
    [aCoder encodeObject:_longProperty forKey:kItemLong];
}

- (id)copyWithZone:(NSZone *)zone
{
    Item *copy = [[Item alloc] init];
    
    if (copy) {

        copy.itemDescription = [self.itemDescription copyWithZone:zone];
        copy.condition = [self.condition copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.pubDate = [self.pubDate copyWithZone:zone];
        copy.lat = [self.lat copyWithZone:zone];
        copy.guid = [self.guid copyWithZone:zone];
        copy.forecast = [self.forecast copyWithZone:zone];
        copy.longProperty = [self.longProperty copyWithZone:zone];
    }
    
    return copy;
}


@end
