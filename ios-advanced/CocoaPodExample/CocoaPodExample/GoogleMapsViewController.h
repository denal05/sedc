//
//  GoogleMapsViewController.h
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/18/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleMaps;

@interface GoogleMapsViewController : UIViewController
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (weak, nonatomic) IBOutlet GMSPanoramaView *panoView;

@end
