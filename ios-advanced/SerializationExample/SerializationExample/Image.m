//
//  Image.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Image.h"


NSString *const kImageHeight = @"height";
NSString *const kImageTitle = @"title";
NSString *const kImageUrl = @"url";
NSString *const kImageWidth = @"width";
NSString *const kImageLink = @"link";


@interface Image ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Image

@synthesize height = _height;
@synthesize title = _title;
@synthesize url = _url;
@synthesize width = _width;
@synthesize link = _link;


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
            self.height = [self objectOrNilForKey:kImageHeight fromDictionary:dict];
            self.title = [self objectOrNilForKey:kImageTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kImageUrl fromDictionary:dict];
            self.width = [self objectOrNilForKey:kImageWidth fromDictionary:dict];
            self.link = [self objectOrNilForKey:kImageLink fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.height forKey:kImageHeight];
    [mutableDict setValue:self.title forKey:kImageTitle];
    [mutableDict setValue:self.url forKey:kImageUrl];
    [mutableDict setValue:self.width forKey:kImageWidth];
    [mutableDict setValue:self.link forKey:kImageLink];

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

    self.height = [aDecoder decodeObjectForKey:kImageHeight];
    self.title = [aDecoder decodeObjectForKey:kImageTitle];
    self.url = [aDecoder decodeObjectForKey:kImageUrl];
    self.width = [aDecoder decodeObjectForKey:kImageWidth];
    self.link = [aDecoder decodeObjectForKey:kImageLink];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_height forKey:kImageHeight];
    [aCoder encodeObject:_title forKey:kImageTitle];
    [aCoder encodeObject:_url forKey:kImageUrl];
    [aCoder encodeObject:_width forKey:kImageWidth];
    [aCoder encodeObject:_link forKey:kImageLink];
}

- (id)copyWithZone:(NSZone *)zone
{
    Image *copy = [[Image alloc] init];
    
    if (copy) {

        copy.height = [self.height copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.width = [self.width copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
    }
    
    return copy;
}


@end
