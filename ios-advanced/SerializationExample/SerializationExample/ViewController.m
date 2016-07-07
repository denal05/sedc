//
//  ViewController.m
//  SerializationExample
//
//  Created by Denis Aleksandrov on 7/7/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"
#import "MySerializableObject.h"
#import <AFNetworking/AFNetworking.h>

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
    
    [self testingScrollView];
}

-(void)testingScrollView
{
    [_myScrollView setBackgroundColor:[UIColor grayColor]];
    
    CGRect tmpFrame = _myScrollView.frame;
    tmpFrame.origin.x = 0;
    tmpFrame.origin.y = 100;
    UIView *containerView = [[UIView alloc] initWithFrame:tmpFrame];
    [containerView setBackgroundColor:[UIColor blueColor]];
    [_myScrollView addSubview:containerView];
    
    tmpFrame.size.height += 100;
    [containerView setFrame:tmpFrame];
    [_myScrollView setContentSize:tmpFrame.size];
    
    UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, tmpFrame.size.height+10, 200, 30)];
    [tmpLabel setText:@"hello world"];
    [_myScrollView addSubview:tmpLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
