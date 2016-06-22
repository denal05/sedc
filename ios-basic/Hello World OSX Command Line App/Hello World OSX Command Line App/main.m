//
//  main.m
//  Hello World OSX Command Line App
//
//  Created by Denis Aleksandrov on 6/14/16.
//  Copyright © 2016 Denis Aleksandrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        Circle *c = [[Circle alloc] initWithRadius:4.0];
        [c printRadius];
        [c setRadius:45 andTheBeginningXCoordinate:5];
    }
    
    return 0;
}
