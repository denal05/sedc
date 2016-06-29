//
//  FirstViewController.m
//  TabBarTest
//
//  Created by Denis Aleksandrov on 6/29/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "FirstViewController.h"
#import "PublicTransportationWithTimeTable.h"
#import "PublicTransportationOnDemand.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize clickedTab;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    switch (clickedTab)
    {
        case 1:
        {
            PublicTransportationOnDemand *taxi = [[PublicTransportationOnDemand alloc] init];
            [taxi setName:@"Taxi"];
            [_nameLabel setText:[taxi name]];
        }
            break;
        case 2:
        {
            PublicTransportationWithTimeTable *bus = [[PublicTransportationWithTimeTable alloc] init];
            [bus setName:@"Bus"];
            [_nameLabel setText:[bus name]];
        }
            break;
        case 3:
        {
            PublicTransportationWithTimeTable *plane = [[PublicTransportationWithTimeTable alloc] init];
            [plane setName:@"Plane"];
            [_nameLabel setText:[plane name]];
        }
            break;
        case 4:
        {
            PublicTransportationWithTimeTable *train = [[PublicTransportationWithTimeTable alloc] init];
            [train setName:@"Train"];
            [_nameLabel setText:[train name]];
        }
            break;
        default:
            [_nameLabel setText:@"none"];
            break;

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
