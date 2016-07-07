//
//  MySerializableObject.h
//  SerializationExample
//
//  Created by Denis Aleksandrov on 7/7/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySerializableObject : NSObject <NSSecureCoding>

@property (nonatomic, retain) NSString *testName;
@property (nonatomic, retain) NSString *testDescription;

@end
