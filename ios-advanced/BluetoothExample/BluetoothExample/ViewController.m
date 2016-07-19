//
//  ViewController.m
//  BluetoothExample
//
//  Created by Denis Aleksandrov on 7/18/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    ////[self startCentralManager];
    [self startPeripheralManager];
    
    [self startMotionManager];
    
    [self localAuthentication];
    */
    
    UILocalNotification *ln = [[UILocalNotification alloc] init];
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setValue:@"val1" forKey:@"key1"];
    [ln setUserInfo:userInfo];
    [ln setAlertBody:@"Testing local notification"];
    [ln setFireDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    [[UIApplication sharedApplication] scheduleLocalNotification:ln];
}

-(void)localAuthentication
{
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@">>> Custom reason for evaluatePolicy" reply:^(BOOL success, NSError * _Nullable error) {
            if (success)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"success" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                });
            }
        }];
    }
    else
    {
        printf(">>> Touch ID not supported! \n");
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"no success!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        });
    }
//    [self localAuthentication];
}

-(void)startCentralManager
{
    _cManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    [_cManager scanForPeripheralsWithServices:nil options:nil];
}

-(void)startPeripheralManager
{
    _pManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    [_pManager startAdvertising:nil];
}

-(void)startMotionManager
{
    _cmManager = [[CMMotionManager alloc] init];
    _cmManager.accelerometerUpdateInterval = 0.01;
    [_cmManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue]  withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        float ax = accelerometerData.acceleration.x;
        float ay = accelerometerData.acceleration.y;
        float az = accelerometerData.acceleration.z;
        ////printf(">>> accelerometerData: x=%f, y=%f, z=%f\n", ax, ay, az);
    }];
    
    _cmManager.gyroUpdateInterval = 0.01;
    
    [_cmManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
        float gx = gyroData.rotationRate.x;
        float gy = gyroData.rotationRate.y;
        float gz = gyroData.rotationRate.z;
        ////printf(">>> gyroData: x=%f, y=%f, z=%f\n", gx, gy, gz);
    }];
    
    _cmManager.magnetometerUpdateInterval = 0.01;
    
    [_cmManager startMagnetometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMMagnetometerData * _Nullable magnetometerData, NSError * _Nullable error) {
        float mx = magnetometerData.magneticField.x;
        float my = magnetometerData.magneticField.y;
        float mz = magnetometerData.magneticField.z;
        ////printf(">>> magnetometerData: x=%f, y=%f, z=%f\n", mx, my, mz);
    }];
}

-(void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    printf(">>> centralManagerDidUpdateState: STATE: %ld\n", central.state);
}

-(void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI
{
    printf(">>> centralManager:didDiscoverPeripheral: \n");
}

-(void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    printf(">>> centralManager:didConnectPeripheral: \n");
}

-(void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    printf(">>> centralManager:didFailToConnectPeripheral: \n");
}

#pragma mark PeripheralManager

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    printf(">>> peripheralManagerDidUpdateState: STATE: %ld \n", peripheral.state);
}

-(void)peripheralManager:(CBPeripheralManager *)peripheral didReceiveWriteRequests:(NSArray<CBATTRequest *> *)requests
{
    printf(">>> peripheralManager:didReceiveWriteRequests: \n");
}

-(void)peripheralManagerDidStartAdvertising:(CBPeripheralManager *)peripheral error:(NSError *)error
{
    printf(">>> peripheralManagerDidStartAdvertising: PERIPHERAL: %s ERROR:%s\n", [[peripheral description] UTF8String], [[error description] UTF8String]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
