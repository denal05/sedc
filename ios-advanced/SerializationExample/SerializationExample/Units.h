//
//  Units.h
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Units : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *temperature;
@property (nonatomic, strong) NSString *speed;
@property (nonatomic, strong) NSString *pressure;
@property (nonatomic, strong) NSString *distance;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
