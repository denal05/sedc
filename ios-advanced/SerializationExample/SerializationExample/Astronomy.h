//
//  Astronomy.h
//
//  Created by Denis Aleksandrov on 7/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Astronomy : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *sunrise;
@property (nonatomic, strong) NSString *sunset;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
