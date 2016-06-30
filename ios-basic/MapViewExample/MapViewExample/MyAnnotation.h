//
//  MyAnnotation.h
//  MapViewExample
//
//  Created by Denis Aleksandrov on 6/30/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MyAnnotation : MKAnnotationView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(instancetype) initWithTitle:(NSString *)myTitle andCoordinate:(CLLocationCoordinate2D)myCoordinate;

@end
