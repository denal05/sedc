//
//  ViewController.m
//  FirstiOSApp
//
//  Created by Denis Aleksandrov on 6/16/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) viewWillAppear:(BOOL)animated
{
    
}

-(void) viewDidAppear:(BOOL)animated
{
    
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [label setText:@"Hello"];
}

-(void) viewWillDisappear:(BOOL)animated
{
    
}

-(void) viewDidDisappear:(BOOL)animated
{
    
}

-(IBAction)buttonClick:(id)sender
{
    NSInteger result = [tf_A.text integerValue] + [tf_B.text integerValue];
    [label setText:[NSString stringWithFormat:@"%ld", (long)result]];
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
