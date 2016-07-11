//
//  Query.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Query.h"
#import "Results.h"


NSString *const kQueryCreated = @"created";
NSString *const kQueryResults = @"results";
NSString *const kQueryCount = @"count";
NSString *const kQueryLang = @"lang";


@interface Query ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Query

@synthesize created = _created;
@synthesize results = _results;
@synthesize count = _count;
@synthesize lang = _lang;


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
            self.created = [self objectOrNilForKey:kQueryCreated fromDictionary:dict];
            self.results = [Results modelObjectWithDictionary:[dict objectForKey:kQueryResults]];
            self.count = [[self objectOrNilForKey:kQueryCount fromDictionary:dict] doubleValue];
            self.lang = [self objectOrNilForKey:kQueryLang fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.created forKey:kQueryCreated];
    [mutableDict setValue:[self.results dictionaryRepresentation] forKey:kQueryResults];
    [mutableDict setValue:[NSNumber numberWithDouble:self.count] forKey:kQueryCount];
    [mutableDict setValue:self.lang forKey:kQueryLang];

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

    self.created = [aDecoder decodeObjectForKey:kQueryCreated];
    self.results = [aDecoder decodeObjectForKey:kQueryResults];
    self.count = [aDecoder decodeDoubleForKey:kQueryCount];
    self.lang = [aDecoder decodeObjectForKey:kQueryLang];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_created forKey:kQueryCreated];
    [aCoder encodeObject:_results forKey:kQueryResults];
    [aCoder encodeDouble:_count forKey:kQueryCount];
    [aCoder encodeObject:_lang forKey:kQueryLang];
}

- (id)copyWithZone:(NSZone *)zone
{
    Query *copy = [[Query alloc] init];
    
    if (copy) {

        copy.created = [self.created copyWithZone:zone];
        copy.results = [self.results copyWithZone:zone];
        copy.count = self.count;
        copy.lang = [self.lang copyWithZone:zone];
    }
    
    return copy;
}


@end
