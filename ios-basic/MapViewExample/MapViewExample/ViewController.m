//
//  ViewController.m
//  MapViewExample
//
//  Created by Denis Aleksandrov on 6/30/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"
#import "MyAnnotation.h"
#import "CoreLocation/CoreLocation.h"

@interface ViewController ()

@end

@implementation ViewController
i=0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [mapView setShowsUserLocation:YES];
    //[mapView setMapType:MKMapTypeSatellite];
    
    CLLocationCoordinate2D location;
    location.latitude = (double) 42.01;
    location.longitude = (double) 21.43;
    
    MyAnnotation *newAnnotation = [[MyAnnotation alloc] initWithTitle:@"Annotation Title" andCoordinate:location];
    [mapView addAnnotation:newAnnotation];
    
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    locationManager.distanceFilter=kCLDistanceFilterNone;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startMonitoringSignificantLocationChanges];
    [locationManager startUpdatingLocation];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setFrame:CGRectMake(10, /*segmentedControl.frame.origin.y+segmentedControl.frame.size.height-10*/ 10, 200, 30)];
    [btn setTitle:@"btn" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tmp:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(IBAction)tmp:(id)sender
{
    printf(">>> btn clicked!\n");
    [(UIButton *)sender removeFromSuperview];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations
{
//    NSLog(@">>>Locations: %@", locations);
//    printf(">>>%d Locations: %f %f\n",
//           i,
//           [[[locations objectAtIndex:0] coordinate].latitude],
//           [[[locations objectAtIndex:0] coordinate].longitude]);
    i++;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch1 = [touches anyObject];
    CGPoint touchLocation = [touch1 locationInView:self.view];
    printf(">>>x=%f y=%f\n", touchLocation.x, touchLocation.y);
}
//touchesEnded
//touchesMoved

-(IBAction)action:(id)sender
{
    UISegmentedControl *tmp = (UISegmentedControl *) sender;
    if (tmp.selectedSegmentIndex == 0)
    {
        [mapView setMapType:MKMapTypeStandard];
    }
    else if (tmp.selectedSegmentIndex == 1)
    {
        [mapView setMapType:MKMapTypeSatellite];
    }
    else
    {
        [mapView setMapType:MKMapTypeHybrid];
    }
}

//-(IBAction)indexChanged:(UISegmentedControl *)sender
//{
//    switch (self.segmentedControl.selectedSegmentIndex)
//    {
//        case 0:
//            self.textLabel.text = @"First selected";
//            break;
//        case 1:
//            self.textLabel.text = @"Second Segment selected";
//            break;
//        default: 
//            break; 
//    } 
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
