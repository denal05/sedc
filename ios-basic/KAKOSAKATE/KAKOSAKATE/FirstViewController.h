//
//  FirstViewController.h
//  KAKOSAKATE
//
//  Created by Denis Aleksandrov on 6/28/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface FirstViewController : UIViewController <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *cityImageImageView;
@property (weak, nonatomic) IBOutlet UITextView *cityDescriptionTextView;

@property(nonatomic) City *firstViewControllerCity;

@end
