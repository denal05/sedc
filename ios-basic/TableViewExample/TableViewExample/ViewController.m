//
//  ViewController.m
//  TableViewExample
//
//  Created by Denis Aleksandrov on 6/21/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"
#import "Food.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    tableViewArray = [[NSMutableArray alloc] init];
    Food *food1 = [[Food alloc] init];
    [food1 setName:@"pizza"];
    [food1 setFoodType:@"pizzaType"];
    [tableViewArray addObject:food1];
     */
    
    NSString *homeDirPath = NSHomeDirectory();
    printf("Home dir: %s\n", [homeDirPath UTF8String]);
    
    NSString *bundlePlistPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
    
    NSString *docDirPlistPath = [NSString stringWithFormat:@"%@/Documents/test.plist", homeDirPath];
    
    NSFileManager *fm = [[NSFileManager alloc] init];
    if (![fm fileExistsAtPath:docDirPlistPath])
    {
        NSError *err = nil;
        [fm copyItemAtPath:bundlePlistPath toPath:docDirPlistPath error:&err];
        
        if (err)
        {
            printf("ERROR: %s\n", [[err localizedDescription] UTF8String]);
        }
        else
        {
            printf("ERROR: NONE\n");
        }
    }
    
    ////NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:bundlePlistPath];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:docDirPlistPath];
    
    printf("Dictionary key-value: %s\n", [[dict valueForKey:@"Key1"] UTF8String]);
    
    [dict setValue:@"blah" forKey:@"Key1"];
    
    printf("Dictionary key-value: %s\n", [[dict valueForKey:@"Key1"] UTF8String]);
    
    [dict writeToFile:docDirPlistPath atomically:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableViewArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ////printf("Row: %ld", indexPath.row);
    ////UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell.textLabel setText:[[tableViewArray objectAtIndex: indexPath.row] name]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    printf("didSelectRowAtIndexPath: %ld", indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
