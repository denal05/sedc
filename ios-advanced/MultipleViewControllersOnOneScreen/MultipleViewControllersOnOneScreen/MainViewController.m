//
//  MainViewController.m
//  MultipleViewControllersOnOneScreen
//
//  Created by Denis Aleksandrov on 7/20/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import <MessageUI/MessageUI.h>

@interface MainViewController () <MFMailComposeViewControllerDelegate>
{
    BOOL isFirstViewVisible;
    FirstViewController * first;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        printf(">>> iPad\n");
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        printf(">>> iPhone\n");
    }
    else
    {
        printf(">>> I HAVE NO IDEA WHAT KIND OF A DEVICE THIS IS!\n");
    }
}

- (IBAction)mailComposeAction:(id)sender {
    MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
    [mail setToRecipients:@[@"denal05@gmail.com"]];
    [mail setSubject:@"Test from MultipleViewControllersOnOneScreen"];
    [mail setMessageBody:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." isHTML:NO];
    [mail setMailComposeDelegate:self];
    
    // If you want to add an attachment:
    /*
     //NSData *data = [NSData dataWithContentsOfFile:<#(nonnull NSString *)#>
     //NSData *data = [NSData dataWithContentsOfURL:<#(nonnull NSURL *)#>];
     //[mail addAttachmentData:<#(nonnull NSData *)#> mimeType:<#(nonnull NSString *)#> fileName:<#(nonnull NSString *)#>];
     */
    
    // If you want to compose and send the email within your app:
    [self presentViewController:mail animated:YES completion:nil];
    
    // If instead you want to open the email app:
    /*
     NSString *mailString = @"mailto:?denal05@gmail.com&subject=test";
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
     */
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (IBAction)mainButtonAction:(id)sender
{
    if (!first)
    {
        first = [[FirstViewController alloc] init];
        [self addChildViewController:first];
        [self.view addSubview:first.view];
    }
    
    printf(">>> Main View Controller Button Action\n");
    CGRect frame = [first.view frame];
    if (isFirstViewVisible)
    {
        frame.origin.x = 0 - self.view.frame.size.width;
        isFirstViewVisible = NO;
    }
    else
    {
        frame.origin.x = 0 - self.view.frame.size.width + (self.view.frame.size.width/3);
        isFirstViewVisible = YES;
    }
    frame.size = self.view.frame.size;
    [UIView animateWithDuration:2 animations:^{
        [first.view setFrame:frame];
    }];
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
