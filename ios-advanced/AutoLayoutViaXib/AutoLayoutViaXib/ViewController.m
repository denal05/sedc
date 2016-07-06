//
//  ViewController.m
//  AutoLayoutViaXib
//
//  Created by Denis Aleksandrov on 7/6/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)bottomCenterButtonAction:(id)sender
{
    if (_bottomLabelBottomConstraint.constant < 60)
    {
        _bottomLabelBottomConstraint.constant = 100;
    }
    else
    {
        _bottomLabelBottomConstraint.constant = 50;
    }
    
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        printf(">>> Animation Done!\n");
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
