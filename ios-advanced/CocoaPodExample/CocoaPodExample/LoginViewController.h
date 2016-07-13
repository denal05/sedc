//
//  LoginViewController.h
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/13/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SSKeychain/SSKeychain.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)login:(id)sender;

@end
