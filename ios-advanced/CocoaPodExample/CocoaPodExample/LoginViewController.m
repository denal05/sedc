//
//  LoginViewController.m
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/13/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "LeftViewController.h"
#import "LoginViewController.h"
#import <ViewDeck/ViewDeck.h>

#define kServiceName @"tmpService"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)login:(id)sender {
    NSString *pass = [SSKeychain passwordForService:kServiceName account:[_usernameTextField text]];
    if (pass)
    {
        printf(">>> A PASS EXISTS \n");
        if ([pass isEqualToString:[_passwordTextField text]])
        {
            printf(">>> LOGGING-IN SUCCESSFULLY :) \n");
            
            MainViewController *main = [[MainViewController alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:main];
            IIViewDeckController *viewDeck = [[IIViewDeckController alloc] initWithCenterViewController:nav leftViewController:[[LeftViewController alloc] init]];
            
            viewDeck.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:viewDeck animated:YES completion: nil];
        }
        else
        {
            printf(">>> WRONG PASS! :( \n");
        }
    }
    else
    {
        if ([[_passwordTextField text] length] > 3)
        {
            if ([SSKeychain setPassword:[_passwordTextField text] forService:kServiceName account:[_usernameTextField text]])
            {
                printf(">>> LOGGING-IN SUCCESSFULLY :) \n");
            }
        }
        else
        {
            printf(">>> PASS TOO SHORT :( \n");
        }
    }
}

@end
