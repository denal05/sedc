//
//  MainViewController.m
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/12/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "MainViewController.h"
#import "DataModels.h"
#import <AFNetworking/AFNetworking.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *apiUrl = @"http://10.80.30.83:3000/db";
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:apiUrl parameters:nil progress: ^(NSProgress * _Nonnull downloadProgress) {
        
        }
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
        {
            printf(">>> SUCCESS\n");
            for (NSDictionary *d in responseObject) {
                Contacts *bc=[[Contacts alloc] initWithDictionary:d];
                printf(">>> id=%ld\n", (long)[bc.id integerValue]);
                printf(">>> first_name=%s\n", [bc.first_name UTF8String]);
            }
        }
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
        {
            printf(">>> ERROR: %s\n", [error.localizedDescription UTF8String]);
        }
    ];
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
