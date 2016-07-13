//
//  Contacts.m
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/13/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Contacts.h"

NSString *const kId         = @"id";
NSString *const kFirstName  = @"first_name";
NSString *const kLastName   = @"last_name";
NSString *const kEmail      = @"email";
NSString *const kGender     = @"gender";
NSString *const kIpAddress  = @"ip_address";
NSString *const kImage      = @"image";

@interface Contacts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Contacts

@synthesize id;
@synthesize first_name;
@synthesize last_name;
@synthesize email;
@synthesize gender;
@synthesize ip_address;
@synthesize image;

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
        self.id = [self objectOrNilForKey:kId fromDictionary:dict];
        self.first_name= [self objectOrNilForKey:kFirstName fromDictionary:dict];
        self.last_name = [self objectOrNilForKey:kLastName fromDictionary:dict];
        self.email= [self objectOrNilForKey:kEmail fromDictionary:dict];
        self.gender= [self objectOrNilForKey:kGender fromDictionary:dict];
        self.ip_address= [self objectOrNilForKey:kIpAddress fromDictionary:dict];
        self.image= [self objectOrNilForKey:kImage fromDictionary:dict];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.id forKey:kId];
    [mutableDict setValue:self.first_name forKey:kFirstName];
    [mutableDict setValue:self.last_name forKey:kLastName];
    [mutableDict setValue:self.email forKey:kEmail];
    [mutableDict setValue:self.gender forKey:kGender];
    [mutableDict setValue:self.ip_address forKey:kIpAddress];
    [mutableDict setValue:self.image forKey:kImage];
    
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
    
    self.id         = [aDecoder decodeObjectForKey:kId];
    self.first_name = [aDecoder decodeObjectForKey:kFirstName];
    self.last_name  = [aDecoder decodeObjectForKey:kLastName];
    self.email      = [aDecoder decodeObjectForKey:kEmail];
    self.gender     = [aDecoder decodeObjectForKey:kGender];
    self.ip_address = [aDecoder decodeObjectForKey:kIpAddress];
    self.image      = [aDecoder decodeObjectForKey:kImage];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:id forKey:kId];
    [aCoder encodeObject:first_name forKey:kFirstName];
    [aCoder encodeObject:last_name forKey:kLastName];
    [aCoder encodeObject:email forKey:kEmail];
    [aCoder encodeObject:gender forKey:kGender];
    [aCoder encodeObject:ip_address forKey:kIpAddress];
    [aCoder encodeObject:image forKey:kImage];
}

- (id)copyWithZone:(NSZone *)zone
{
    Contacts *copy = [[Contacts alloc] init];
    
    if (copy) {
        
        copy.id = [self.id copyWithZone:zone];
        copy.first_name = [self.first_name copyWithZone:zone];
        copy.last_name = [self.last_name copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
        copy.ip_address = [self.ip_address copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
    }
    
    return copy;
}

@end
