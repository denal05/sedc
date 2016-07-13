//
//  LeftViewController.h
//  CocoaPodExample
//
//  Created by Denis Aleksandrov on 7/12/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray  *tableViewArray;
    __weak IBOutlet UITableView *tableView;
}

@end
