//
//  Circle.h
//  Hello World OSX Command Line App
//
//  Created by Denis Aleksandrov on 6/14/16.
//  Copyright © 2016 Denis Aleksandrov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Circle : NSObject
{
    float radius;
}

-(instancetype)initWithRadius:(float)r;
-(void)printRadius;
-(void)setRadius:(float)r andTheBeginningXCoordinate:(float)x;

@end
