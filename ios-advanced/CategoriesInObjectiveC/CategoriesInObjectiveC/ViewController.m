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
    
    // Timer #1
    [self performSelector:@selector(f1) withObject:nil afterDelay:3];
    
    // To cancel performSelector:afterDelay:
    ////[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(f1) object:nil];
    
    // Timer #2
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(f2) userInfo:nil repeats:NO];
    
    // To cancel NSTimer
    ////[timer invalidate];
    
    // Timer #3
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        printf(">>>timer3\n");
    });
    
    // Returns current time
    NSDate *date = [NSDate date];
    
    // Returns current time + x seconds
    int x = 4;
    [NSDate dateWithTimeIntervalSinceNow:x];
    
    // Returns 1970
    [NSDate dateWithTimeIntervalSince1970:0];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"hh:mm:ss dd.MM.yyyy"];
    printf(">>>%s\n", [[date description] UTF8String]);
    NSString *dateString = [dateFormatter stringFromDate:date];
    printf(">>>%s\n", [dateString UTF8String]);
}

-(void)f1
{
    printf(">>>timer1\n");
}

-(void)f2
{
    printf(">>>timer2\n");
}

-(void)test1
{
    
}

-(void)test2:(NSString *)tmp
{
    
}

-(id)test3
{
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
