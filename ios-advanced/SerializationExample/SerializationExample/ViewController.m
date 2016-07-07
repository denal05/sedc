//
//  ViewController.m
//  SerializationExample
//
//  Created by Denis Aleksandrov on 7/7/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"
#import "MySerializableObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSUserDefaults standardUserDefaults] setObject:@"tmp" forKey:@"1"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    printf(">>>standardUserDefaults value: %s forKey: 1\n", [[[NSUserDefaults standardUserDefaults] objectForKey:@"1"] UTF8String]);
    
    MySerializableObject *serObj = [[MySerializableObject alloc] init];
    NSData *archivedSerObj = [NSKeyedArchiver archivedDataWithRootObject:serObj];
    
    [[NSUserDefaults standardUserDefaults] setObject:archivedSerObj forKey:@"serObj"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    NSData *unarchivedSerObj = [[NSUserDefaults standardUserDefaults] objectForKey:@"serObj"];
    MySerializableObject *unserObj = [NSKeyedUnarchiver unarchiveObjectWithData:unarchivedSerObj];
    
    printf(">>>%s %s\n", [unserObj.testName UTF8String], [unserObj.testDescription UTF8String]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
