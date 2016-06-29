//
//  FirstViewController.h
//  TabBarTest
//
//  Created by Denis Aleksandrov on 6/29/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (nonatomic, assign) NSInteger clickedTab;
                            // NSObject *publictransporttype

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
