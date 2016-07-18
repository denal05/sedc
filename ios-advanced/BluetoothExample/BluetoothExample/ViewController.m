//
//  ViewController.m
//  BluetoothExample
//
//  Created by Denis Aleksandrov on 7/18/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ////[self startCentralManager];
    [self startPeripheralManager];
    
    [self startMotionManager];
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
        float x = accelerometerData.acceleration.x;
        float y = accelerometerData.acceleration.y;
        float z = accelerometerData.acceleration.z;
        printf(">>> accelerometerData: x=%f, y=%f, z=%f\n", x, y, z);
    }];
    
    _cmManager.gyroUpdateInterval = 0.01;
    
    [_cmManager startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
        float x = gyroData.rotationRate.x;
        float y = gyroData.rotationRate.y;
        float z = gyroData.rotationRate.z;
    }];
    
    _cmManager.magnetometerUpdateInterval = 0.01;
    
    [_cmManager startMagnetometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMMagnetometerData * _Nullable magnetometerData, NSError * _Nullable error) {
        float x = magnetometerData.magneticField.x;
        float y = magnetometerData.magneticField.y;
        float z = magnetometerData.magneticField.z;
    }];
}

-(void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    printf(">>> centralManagerDidUpdateState: \n");
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
