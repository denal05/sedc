//
//  main.m
//  Inheritance Example WIth Properties
//
//  Created by Denis Aleksandrov on 6/15/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circle.h"
#import "Rectangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        Shape * s_circle = [[Circle alloc] initWithX:3.5 andWithY:2.65 andWithRadius:5.55];
        NSLog( @"x=%f, y=%f, r=%f", [s_circle x], [s_circle y], [(Circle *)s_circle radius] );
        
        Shape * s_rectangle = [[Rectangle alloc] initWithWidth:1.5 andWithHeight:2.5 andWithX:3.5 andWithY:4.5];
        NSLog( @"x=%f, y=%f, w=%f, h=%f", [s_rectangle x], [s_rectangle y], [(Rectangle *)s_rectangle width], [(Rectangle *)s_rectangle height] );
        
        NSArray *array = [[NSArray alloc] initWithObjects:s_circle,s_rectangle, nil];
        for (int i=0; i < [array count]; i++)
        {
            NSLog(@"array[%d] y=%f", i, [[array objectAtIndex:i] y]);
        }
        
        NSMutableArray *mArray = [[NSMutableArray alloc] init];
        
        [mArray addObject:s_circle];
        NSLog(@"mArray %@ count=%lu", mArray, (unsigned long) [mArray count]);
        
        [mArray removeLastObject];
        NSLog(@"mArray %@ count=%lu", mArray, (unsigned long) [mArray count]);
        
        [mArray insertObject:s_circle atIndex:0];
        NSLog(@"mArray %@ count=%lu", mArray, (unsigned long) [mArray count]);
        
    }
    
    return 0;
}
