//
//  ViewController.h
//  TableViewExample
//
//  Created by Denis Aleksandrov on 6/21/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *tableViewArray;
}

@end

