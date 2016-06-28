//
//  SecondViewController.h
//  KAKOSAKATE
//
//  Created by Denis Aleksandrov on 6/28/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@property(nonatomic) City *secondViewControllerCity;

@end
