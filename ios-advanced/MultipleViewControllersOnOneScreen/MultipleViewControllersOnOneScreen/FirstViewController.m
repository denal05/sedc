//
//  FirstViewController.m
//  MultipleViewControllersOnOneScreen
//
//  Created by Denis Aleksandrov on 7/20/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "FirstViewController.h"
#import "MainViewController.h"

@interface FirstViewController ()
{
    UIImagePickerController *imagePicker;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)firstButtonAction:(id)sender
{
    printf(">>> First View Controller Button Action\n");
    imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    printf(">>> Put a breakpoint here to see the image object :) \n");
    [_imageView setImage:image];
    [[(MainViewController *)self.parentViewController imageView] setImage:image];
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
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
