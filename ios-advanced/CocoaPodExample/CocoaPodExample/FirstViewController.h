//
//  FirstViewController.h
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/12/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contacts.h"

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *fvc_labelFirstName;
@property (nonatomic) Contacts *currentContact;

@end
