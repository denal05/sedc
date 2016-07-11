//
//  Wind.h
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Wind : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *chill;
@property (nonatomic, strong) NSString *direction;
@property (nonatomic, strong) NSString *speed;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
