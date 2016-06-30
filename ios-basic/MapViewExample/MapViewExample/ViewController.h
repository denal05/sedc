//
//  ViewController.h
//  MapViewExample
//
//  Created by Denis Aleksandrov on 6/30/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    IBOutlet MKMapView *mapView;
    IBOutlet UIView *segmentedControl;
    CLLocationManager *locationManager;
    NSInteger i;
}

@end

