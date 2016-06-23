//
//  ViewController.m
//  FirstiOSApp
//
//  Created by Denis Aleksandrov on 6/16/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) viewWillAppear:(BOOL)animated
{
    
}

-(void) viewDidAppear:(BOOL)animated
{
    
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ////[label setText:@"Hello"];
    
    NSString *website = @"https://www.cocoacontrols.com/";
    NSURL *url = [NSURL URLWithString:website];
    NSString *stringFromURL = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    printf("URL:\n%s\nResponse:\n%s\n", [website UTF8String], [stringFromURL UTF8String]);
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [webView loadRequest:urlRequest];
    
    // @TODO Add actionSheet that has buttons for Google, Facebook and CNN
    UIActionSheet *ash = [[UIActionSheet alloc] initWithTitle:@"Title" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Dismiss" otherButtonTitles:@"Item1",@"Item2",nil];
    [ash showInView:self.view];

}

-(void) viewWillDisappear:(BOOL)animated
{
    
}

-(void) viewDidDisappear:(BOOL)animated
{
    
}

-(IBAction)buttonClick:(id)sender
{
    NSInteger result = [tf_A.text integerValue] + [tf_B.text integerValue];
    [label setText:[NSString stringWithFormat:@"%ld", (long)result]];
}

-(void) webViewDidStartLoad:(UIWebView *) webView
{
    printf(">>> webViewDidStartLoad\n");
}

-(void) webViewDidFinishLoad:(UIWebView *) webView
{
    printf(">>> webViewDidFinishLoad\n");
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *) error
{
    printf(">>> ERROR\n");
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
