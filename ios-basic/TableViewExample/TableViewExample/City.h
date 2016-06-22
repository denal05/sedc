//
//  City.h
//  TableViewExample
//
//  Created by Denis Aleksandrov on 6/22/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
@property (nonatomic, copy)     NSString*   name;
@property (nonatomic, assign)   float       temperature;
@property (nonatomic, copy)     NSString*   image;

@end
