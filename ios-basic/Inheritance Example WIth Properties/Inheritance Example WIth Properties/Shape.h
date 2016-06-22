//
//  Shape.h
//  Inheritance Example WIth Properties
//
//  Created by Denis Aleksandrov on 6/15/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject

@property (atomic, assign) float x;
@property (atomic, assign) float y;

//-(instancetype)initWithX:(float)newX;
//-(instancetype)initWithY:(float)newY;
//-(void)setX:(float)newX;
//-(void)setY:(float)newY;
-(instancetype)initWithX:(float)_x andWithY:(float)_y;
-(void)setXY:(float)_x andNewY:(float)_y;
-(void)printCoordinates;

@end
