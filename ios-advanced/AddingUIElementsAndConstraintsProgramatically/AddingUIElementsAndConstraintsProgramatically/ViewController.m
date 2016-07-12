//
//  ViewController.m
//  AddingUIElementsAndConstraintsProgramatically
//
//  Created by Denis Aleksandrov on 7/12/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *myButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [myButton setTitle:@"button" forState:UIControlStateNormal];
    [myButton setFrame:CGRectMake(0, 20, 200, 30)];
    [myButton setBackgroundColor:[UIColor redColor]];
    [myButton addTarget:self action:@selector(myButtonAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:myButton];
    myButton.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *buttonConstraint1 = [NSLayoutConstraint constraintWithItem:myButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];

    NSLayoutConstraint *buttonConstraint2 = [NSLayoutConstraint constraintWithItem:myButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *buttonConstraint3 = [NSLayoutConstraint constraintWithItem:myButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:50];
    
    NSLayoutConstraint *buttonConstraint4 = [NSLayoutConstraint constraintWithItem:myButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    
    [self.view addConstraints:@[buttonConstraint1,buttonConstraint2,buttonConstraint3,buttonConstraint4]];
    
    ////////
    
    UILabel *myLabel = [[UILabel alloc] init];
    [myLabel setText:@"label"];
    [myLabel setFrame:CGRectMake(self.view.frame.size.width-200, 0, 200, 30)];
    [myLabel setBackgroundColor:[UIColor grayColor]];
    
    [self.view addSubview:myLabel];
    myLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *labelConstraint1 = [NSLayoutConstraint constraintWithItem:myLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:myButton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:50];

    NSLayoutConstraint *labelConstraint2 = [NSLayoutConstraint constraintWithItem:myLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    [self.view addConstraints:@[labelConstraint1,labelConstraint2]];
}

-(IBAction)myButtonAction:(id)sender
{
    printf(">>> Button Clicked!\n");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
