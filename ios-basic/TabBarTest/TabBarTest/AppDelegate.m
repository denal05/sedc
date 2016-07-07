//
//  AppDelegate.m
//  TabBarTest
//
//  Created by Denis Aleksandrov on 6/29/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen ] bounds]];

    FirstViewController *first = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    [first setTitle:@"1"];
    [first setClickedTab:1];
    /*
    UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    [first setTabBarItem:item];
    [first.tabBarItem setImage:[UIImage imageNamed:@""]];
    */
    
    FirstViewController *second = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    [second setTitle:@"2"];
    [second setClickedTab:2];
    
    FirstViewController *third = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    [third setTitle:@"3"];
    [third setClickedTab:3];
    
    FirstViewController *fourth = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    [fourth setTitle:@"4"];
    [fourth setClickedTab:4];
    
    SecondViewController *blank = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    [tabBar setViewControllers:@[first,second,third,fourth]];
    
    [self.window setRootViewController:tabBar];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end