//
//  ViewController.m
//  CategoriesInObjectiveC
//
//  Created by Denis Aleksandrov on 7/14/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_myLabel setDefaultSettings];
    [_myTextView setRandomColor];
    [_myTextView removeSpaces];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
