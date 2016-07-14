//
//  Test.h
//  CategoriesInObjectiveC
//
//  Created by Denis Aleksandrov on 7/14/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test <NSObject>

-(void)test1;
-(void)test2:(id)tmp;
-(id)test3;

@optional
-(void)test4;

@end
