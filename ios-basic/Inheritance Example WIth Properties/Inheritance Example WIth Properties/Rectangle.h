//
//  Rectangle.h
//  Inheritance Example WIth Properties
//
//  Created by Denis Aleksandrov on 6/15/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "Shape.h"

@interface Rectangle : Shape
@property (assign) float width;
@property (assign) float height;

-(instancetype)initWithWidth:(float)_w andWithHeight:(float)_h andWithX:(float)_x andWithY:(float)_y;

@end
