//
//  Circle.h
//  Inheritance Example WIth Properties
//
//  Created by Denis Aleksandrov on 6/15/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Shape.h"

@interface Circle : Shape

@property (assign) float radius;

-(instancetype)initWithRadius:(float)r;
-(void)printRadius;
-(void)setRadius:(float)r andTheBeginningXCoordinate:(float)x;

-(instancetype)initWithX:(float)_x andWithY:(float)_y andWithRadius:(float)r;

@end
