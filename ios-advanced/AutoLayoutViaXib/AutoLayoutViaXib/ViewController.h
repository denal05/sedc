//
//  ViewController.h
//  AutoLayoutViaXib
//
//  Created by Denis Aleksandrov on 7/6/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
    
@property (weak, nonatomic) IBOutlet UIButton *BottomCenterButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLabelBottomConstraint;

@end

