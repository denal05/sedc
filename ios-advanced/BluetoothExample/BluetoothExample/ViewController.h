//
//  ViewController.h
//  BluetoothExample
//
//  Created by Denis Aleksandrov on 7/18/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController <CBCentralManagerDelegate, CBPeripheralManagerDelegate>

@property (nonatomic,retain) CBCentralManager *cManager;
@property (nonatomic,retain) CBPeripheralManager *pManager;
@property (nonatomic,retain) CBPeripheral *peripheral;

@property (nonatomic,retain) CMMotionManager *cmManager;

@end
