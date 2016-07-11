//
//  Results.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Results.h"
#import "Channel.h"


NSString *const kResultsChannel = @"channel";


@interface Results ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Results

@synthesize channel = _channel;


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
            self.channel = [Channel modelObjectWithDictionary:[dict objectForKey:kResultsChannel]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.channel dictionaryRepresentation] forKey:kResultsChannel];

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

    self.channel = [aDecoder decodeObjectForKey:kResultsChannel];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_channel forKey:kResultsChannel];
}

- (id)copyWithZone:(NSZone *)zone
{
    Results *copy = [[Results alloc] init];
    
    if (copy) {

        copy.channel = [self.channel copyWithZone:zone];
    }
    
    return copy;
}


@end
