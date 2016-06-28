//
//  FirstViewController.m
//  KAKOSAKATE
//
//  Created by Denis Aleksandrov on 6/28/16.
//  Copyright © 2016 INform. All rights reserved.
//

//|<Back  Skopje   >* |
//---------------------
//  {               }
//  { image         }
//  {               }
//
//  {               }
//  { description   }
//  {               }

//* ActionSheet buttons: @"Open Website", @"Cancel"

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "City.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (IBAction)closeFirstViewControllerOnButtonClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_cityDescriptionTextView setText:_firstViewControllerCity.description];
    [_cityImageImageView setImage:[UIImage imageWithContentsOfFile:_firstViewControllerCity.image]];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(openAction)];
    [self.navigationItem setRightBarButtonItem:item];
    
}

-(void)openAction
{
    UIActionSheet *a = [[UIActionSheet alloc] initWithTitle:@"Open" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Web page", nil];
    [a showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        SecondViewController *second = [[SecondViewController alloc] init];
        [second setTitle:_firstViewControllerCity.name];
        [second setSecondViewControllerCity:_firstViewControllerCity];
        [self.navigationController pushViewController:second animated:YES];
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
