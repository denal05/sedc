//
//  MySerializableObject.m
//  SerializationExample
//
//  Created by Denis Aleksandrov on 7/7/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "MySerializableObject.h"
#define kTestName @"testName"
#define kTestDescription @"testDescription"

@implementation MySerializableObject
@synthesize testName;
@synthesize testDescription;

-(instancetype) init
{
    self = [super init];
    if (self)
    {
        [self setTestName:kTestName];
        [self setTestDescription:kTestDescription];
    }
    return self;
}

-(instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        [self setTestName:[aDecoder decodeObjectForKey:kTestName]];
        [self setTestDescription:[aDecoder decodeObjectForKey:kTestDescription]];
    }
    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.testName forKey:@"testName"];
    [aCoder encodeObject:self.testDescription forKey:@"testDescription"];
}

+(BOOL) supportsSecureCoding
{
    return YES;
}

@end
