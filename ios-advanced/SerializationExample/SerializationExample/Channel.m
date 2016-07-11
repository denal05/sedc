//
//  Channel.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Channel.h"
#import "Item.h"
#import "Units.h"
#import "Wind.h"
#import "Location.h"
#import "Image.h"
#import "Atmosphere.h"
#import "Astronomy.h"


NSString *const kChannelDescription = @"description";
NSString *const kChannelTtl = @"ttl";
NSString *const kChannelLink = @"link";
NSString *const kChannelItem = @"item";
NSString *const kChannelUnits = @"units";
NSString *const kChannelWind = @"wind";
NSString *const kChannelTitle = @"title";
NSString *const kChannelLocation = @"location";
NSString *const kChannelImage = @"image";
NSString *const kChannelLastBuildDate = @"lastBuildDate";
NSString *const kChannelLanguage = @"language";
NSString *const kChannelAtmosphere = @"atmosphere";
NSString *const kChannelAstronomy = @"astronomy";


@interface Channel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Channel

@synthesize channelDescription = _channelDescription;
@synthesize ttl = _ttl;
@synthesize link = _link;
@synthesize item = _item;
@synthesize units = _units;
@synthesize wind = _wind;
@synthesize title = _title;
@synthesize location = _location;
@synthesize image = _image;
@synthesize lastBuildDate = _lastBuildDate;
@synthesize language = _language;
@synthesize atmosphere = _atmosphere;
@synthesize astronomy = _astronomy;


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
            self.channelDescription = [self objectOrNilForKey:kChannelDescription fromDictionary:dict];
            self.ttl = [self objectOrNilForKey:kChannelTtl fromDictionary:dict];
            self.link = [self objectOrNilForKey:kChannelLink fromDictionary:dict];
            self.item = [Item modelObjectWithDictionary:[dict objectForKey:kChannelItem]];
            self.units = [Units modelObjectWithDictionary:[dict objectForKey:kChannelUnits]];
            self.wind = [Wind modelObjectWithDictionary:[dict objectForKey:kChannelWind]];
            self.title = [self objectOrNilForKey:kChannelTitle fromDictionary:dict];
            self.location = [Location modelObjectWithDictionary:[dict objectForKey:kChannelLocation]];
            self.image = [Image modelObjectWithDictionary:[dict objectForKey:kChannelImage]];
            self.lastBuildDate = [self objectOrNilForKey:kChannelLastBuildDate fromDictionary:dict];
            self.language = [self objectOrNilForKey:kChannelLanguage fromDictionary:dict];
            self.atmosphere = [Atmosphere modelObjectWithDictionary:[dict objectForKey:kChannelAtmosphere]];
            self.astronomy = [Astronomy modelObjectWithDictionary:[dict objectForKey:kChannelAstronomy]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.channelDescription forKey:kChannelDescription];
    [mutableDict setValue:self.ttl forKey:kChannelTtl];
    [mutableDict setValue:self.link forKey:kChannelLink];
    [mutableDict setValue:[self.item dictionaryRepresentation] forKey:kChannelItem];
    [mutableDict setValue:[self.units dictionaryRepresentation] forKey:kChannelUnits];
    [mutableDict setValue:[self.wind dictionaryRepresentation] forKey:kChannelWind];
    [mutableDict setValue:self.title forKey:kChannelTitle];
    [mutableDict setValue:[self.location dictionaryRepresentation] forKey:kChannelLocation];
    [mutableDict setValue:[self.image dictionaryRepresentation] forKey:kChannelImage];
    [mutableDict setValue:self.lastBuildDate forKey:kChannelLastBuildDate];
    [mutableDict setValue:self.language forKey:kChannelLanguage];
    [mutableDict setValue:[self.atmosphere dictionaryRepresentation] forKey:kChannelAtmosphere];
    [mutableDict setValue:[self.astronomy dictionaryRepresentation] forKey:kChannelAstronomy];

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

    self.channelDescription = [aDecoder decodeObjectForKey:kChannelDescription];
    self.ttl = [aDecoder decodeObjectForKey:kChannelTtl];
    self.link = [aDecoder decodeObjectForKey:kChannelLink];
    self.item = [aDecoder decodeObjectForKey:kChannelItem];
    self.units = [aDecoder decodeObjectForKey:kChannelUnits];
    self.wind = [aDecoder decodeObjectForKey:kChannelWind];
    self.title = [aDecoder decodeObjectForKey:kChannelTitle];
    self.location = [aDecoder decodeObjectForKey:kChannelLocation];
    self.image = [aDecoder decodeObjectForKey:kChannelImage];
    self.lastBuildDate = [aDecoder decodeObjectForKey:kChannelLastBuildDate];
    self.language = [aDecoder decodeObjectForKey:kChannelLanguage];
    self.atmosphere = [aDecoder decodeObjectForKey:kChannelAtmosphere];
    self.astronomy = [aDecoder decodeObjectForKey:kChannelAstronomy];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_channelDescription forKey:kChannelDescription];
    [aCoder encodeObject:_ttl forKey:kChannelTtl];
    [aCoder encodeObject:_link forKey:kChannelLink];
    [aCoder encodeObject:_item forKey:kChannelItem];
    [aCoder encodeObject:_units forKey:kChannelUnits];
    [aCoder encodeObject:_wind forKey:kChannelWind];
    [aCoder encodeObject:_title forKey:kChannelTitle];
    [aCoder encodeObject:_location forKey:kChannelLocation];
    [aCoder encodeObject:_image forKey:kChannelImage];
    [aCoder encodeObject:_lastBuildDate forKey:kChannelLastBuildDate];
    [aCoder encodeObject:_language forKey:kChannelLanguage];
    [aCoder encodeObject:_atmosphere forKey:kChannelAtmosphere];
    [aCoder encodeObject:_astronomy forKey:kChannelAstronomy];
}

- (id)copyWithZone:(NSZone *)zone
{
    Channel *copy = [[Channel alloc] init];
    
    if (copy) {

        copy.channelDescription = [self.channelDescription copyWithZone:zone];
        copy.ttl = [self.ttl copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.item = [self.item copyWithZone:zone];
        copy.units = [self.units copyWithZone:zone];
        copy.wind = [self.wind copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.lastBuildDate = [self.lastBuildDate copyWithZone:zone];
        copy.language = [self.language copyWithZone:zone];
        copy.atmosphere = [self.atmosphere copyWithZone:zone];
        copy.astronomy = [self.astronomy copyWithZone:zone];
    }
    
    return copy;
}


@end
