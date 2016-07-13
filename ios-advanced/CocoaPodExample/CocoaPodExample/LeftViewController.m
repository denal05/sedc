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
#import "Contacts.h"
#import <ViewDeck/ViewDeck.h>
#import <AFNetworking/AFNetworking.h>

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    tableViewArray = [[NSMutableArray alloc] init];
    
    NSString *apiUrl = @"http://localhost/1000contacts.json";
    
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
             printf(">>> id=%ld first_name=%s\n", (long)[bc.id integerValue], [bc.first_name UTF8String]);
             [tableViewArray addObject:bc];
         }
         [tableView reloadData];
     }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
     {
         printf(">>> ERROR: %s\n", [error.localizedDescription UTF8String]);
     }
     ];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableViewArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSString *full_name = [[NSString alloc] initWithString:[[tableViewArray objectAtIndex: indexPath.row] first_name]];
    full_name = [full_name stringByAppendingString:@" "];
    full_name = [full_name stringByAppendingString:[[tableViewArray objectAtIndex: indexPath.row] last_name]];
    [cell.textLabel setText:full_name];
//    NSNumber *tmpId = [[NSNumber alloc] initWithInteger:[[[tableViewArray objectAtIndex: indexPath.row] id] intValue]];
//    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%ld", (long)tmpId]];
//    [cell.imageView setImage:[UIImage imageWithContentsOfFile:[[tableViewArray objectAtIndex: indexPath.row] image]]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    printf("didSelectRowAtIndexPath: %ld", indexPath.row);
    
    // @TODO
    // viewDeck already has instances to all the view controllers. Declare a @property in FirstViewcontroller and set it from LeftViewController when initializing FirstViewcontroller to pass info. Write a method to update the text of a label in FirstViewcontroller.
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
