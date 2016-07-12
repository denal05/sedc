//
//  LeftViewController.m
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/12/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "LeftViewController.h"
#import "FirstViewController.h"
#import "MainViewController.h"
#import <ViewDeck/ViewDeck.h>

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)button1Action:(id)sender {
    /*
    MainViewController *tmpMainViewController = [self.viewDeckController centerController];
    [tmpMainViewController presentViewController:[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] animated:YES completion:^{
        ////[self.viewDeckController closeLeftViewAnimated:YES];
    }];
    */
    
    [(UINavigationController *) [self.viewDeckController centerController] pushViewController:[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] animated:YES];
    [self.viewDeckController closeLeftViewAnimated:YES];
}

- (IBAction)button2Action:(id)sender {
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
