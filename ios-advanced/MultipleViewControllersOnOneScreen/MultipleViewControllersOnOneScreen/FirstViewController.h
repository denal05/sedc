//
//  FirstViewController.h
//  MultipleViewControllersOnOneScreen
//
//  Created by Denis Aleksandrov on 7/20/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
