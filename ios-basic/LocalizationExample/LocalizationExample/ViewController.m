//
//  ViewController.m
//  LocalizationExample
//
//  Created by Denis Aleksandrov on 7/4/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ////NSLog(@"%@", NSLocalizedString(@"key", @"reading key value..."));
    ////NSLog(@"%@", NSLocalizedStringFromTable(@"key", @"Main", @""));
    
    printf(">>> %s\n", [NSLocalizedString(@"key", @"reading key value...") UTF8String] );
    printf(">>> %s\n", [NSLocalizedStringFromTable(@"key", @"Main", @"") UTF8String] );
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observerTest:) name:@"Test" object:nil];
    /*
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    */
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Test" object:nil userInfo:@{@"key":@"value"}];
}

-(void)observerTest:(NSNotification *) notification
{
    printf(">>> observerTest() \n");
    if ([[notification name] isEqualToString:@"Test"])
    {
        printf(">>> notification userInfo: %s\n>>> notification object: %s\n", [[[notification userInfo] description] UTF8String], [notification object]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
