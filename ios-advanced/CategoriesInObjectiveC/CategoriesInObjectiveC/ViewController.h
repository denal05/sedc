//
//  ViewController.h
//  CategoriesInObjectiveC
//
//  Created by Denis Aleksandrov on 7/14/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+TextColor.h"
#import "UITextView+TextColorSpaces.h"
#import "Test.h"

@interface ViewController : UIViewController <Test>

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;


@end

