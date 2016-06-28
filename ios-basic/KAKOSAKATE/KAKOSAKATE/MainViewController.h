//
//  MainViewController.h
//  KAKOSAKATE
//
//  Created by Denis Aleksandrov on 6/28/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *tableViewArray;
}

@end
