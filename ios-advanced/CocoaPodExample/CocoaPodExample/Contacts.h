//
//  Contacts.h
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/13/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contacts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *first_name;
@property (nonatomic, strong) NSString *last_name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *ip_address;
@property (nonatomic, strong) NSString *image;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
