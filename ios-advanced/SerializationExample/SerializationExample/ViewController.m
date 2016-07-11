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
#import "BaseClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
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
    */
    //////////////////////////////////
    
    NSString *apiUrl = @"http://jsonplaceholder.typicode.com/posts?userId=1";
    _dataArray = [NSMutableArray new];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:apiUrl parameters:nil progress: ^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            printf(">>> SUCCESS\n");
            for (NSDictionary *d in responseObject)
            {
                BaseClass *bc = [[BaseClass alloc] initWithDictionary:d];
                printf(">>>>>> id=%f, title=%s\n", bc.internalBaseClassIdentifier, [bc.title UTF8String]);
            }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        printf(">>> ERROR: %s\n", [error.localizedDescription UTF8String]);
    }];
}

-(void)printDataArray
{
    printf(">>> printDataArray()\n");
    for (BaseClass *bc in _dataArray)
    {
        printf(">>>>>> id=%f, title=%s\n", bc.internalBaseClassIdentifier, bc.title);
    }
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
