//
//  Atmosphere.h
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Atmosphere : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *humidity;
@property (nonatomic, strong) NSString *visibility;
@property (nonatomic, strong) NSString *pressure;
@property (nonatomic, strong) NSString *rising;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
