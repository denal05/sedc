//
//  BaseClass.m
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"


NSString *const kBaseClassBody = @"body";
NSString *const kBaseClassId = @"id";
NSString *const kBaseClassTitle = @"title";
NSString *const kBaseClassUserId = @"userId";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize body = _body;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize title = _title;
@synthesize userId = _userId;


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
            self.body = [self objectOrNilForKey:kBaseClassBody fromDictionary:dict];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kBaseClassId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kBaseClassTitle fromDictionary:dict];
            self.userId = [[self objectOrNilForKey:kBaseClassUserId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.body forKey:kBaseClassBody];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kBaseClassId];
    [mutableDict setValue:self.title forKey:kBaseClassTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userId] forKey:kBaseClassUserId];

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

    self.body = [aDecoder decodeObjectForKey:kBaseClassBody];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kBaseClassId];
    self.title = [aDecoder decodeObjectForKey:kBaseClassTitle];
    self.userId = [aDecoder decodeDoubleForKey:kBaseClassUserId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_body forKey:kBaseClassBody];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kBaseClassId];
    [aCoder encodeObject:_title forKey:kBaseClassTitle];
    [aCoder encodeDouble:_userId forKey:kBaseClassUserId];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.body = [self.body copyWithZone:zone];
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.userId = self.userId;
    }
    
    return copy;
}


@end
