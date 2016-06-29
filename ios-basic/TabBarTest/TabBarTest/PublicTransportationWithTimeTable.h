//
//  PublicTransportationWithTimeTable.h
//  TabBarTest
//
//  Created by Denis Aleksandrov on 6/29/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicTransportationWithTimeTable : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* image;
@property (nonatomic, copy) NSString* description;
@property (nonatomic, copy) NSArray*  timeTable;

@end
