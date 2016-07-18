//
//  GoogleMapsViewController.m
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/18/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "GoogleMapsViewController.h"

@interface GoogleMapsViewController ()

@end

@implementation GoogleMapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:6];
    [_mapView setCamera:camera];
    _mapView.myLocationEnabled = YES;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"SYDNEY";
    marker.snippet = @"Australia";
    marker.map = _mapView;
    
    [_panoView moveNearCoordinate:CLLocationCoordinate2DMake(-33.732, 150.312)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
