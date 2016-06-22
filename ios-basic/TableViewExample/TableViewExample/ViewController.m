//
//  ViewController.m
//  TableViewExample
//
//  Created by Denis Aleksandrov on 6/21/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import "ViewController.h"
#import "Food.h"
#import "City.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    tableViewArray = [[NSMutableArray alloc] init];
    
    daysOfWeek = @[@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday"];
    
    i = 0;
    [dayOfWeekLabel setText:daysOfWeek[0]];
    
    float randTemp = 0.0;
    
    NSString *homeDirPath = NSHomeDirectory();
    printf("Home dir: %s\n", [homeDirPath UTF8String]);
    
    NSString *bundlePlistPath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"];
    
    NSString *docDirPlistPath = [NSString stringWithFormat:@"%@/Documents/test.plist", homeDirPath];
    
    NSString *docDirSunnyImagePath = [NSString stringWithFormat:@"%@/Documents/sunny.png", homeDirPath];
    
    NSString *docDirRainyImagePath = [NSString stringWithFormat:@"%@/Documents/rainy.png", homeDirPath];
    
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
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:docDirPlistPath];
    NSDictionary *dayOfWeekDic = [dict objectForKey:@"dayOfWeek"];
    NSDictionary *monday = [dayOfWeekDic objectForKey:@"Monday"];
    NSString *temp = [[monday valueForKey:@"skopjeCityTemperature"] stringValue];
    
    printf("Dictionary key-value: %s\n", [temp UTF8String]);
    
    [dict setValue:@"blah" forKey:@"Key1"];
    
    printf("Dictionary key-value: %s\n", [[dict valueForKey:@"Key1"] UTF8String]);
    
    [dict writeToFile:docDirPlistPath atomically:YES];
    
    randTemp = arc4random_uniform(10) + 30;
    City *skopjeCity = [[City alloc] init];
    [skopjeCity setName:@"Skopje"];
    [skopjeCity setTemperature:randTemp];
    [skopjeCity setImage:docDirSunnyImagePath];
    [tableViewArray addObject:skopjeCity];
    
    randTemp = arc4random_uniform(10) + 30;
    City *kumanovoCity = [[City alloc] init];
    [kumanovoCity setName:@"Kumanovo"];
    [kumanovoCity setTemperature:randTemp];
    [kumanovoCity setImage:docDirRainyImagePath];
    [tableViewArray addObject:kumanovoCity];
    
    randTemp = arc4random_uniform(10) + 30;
    City *gostivarCity = [[City alloc] init];
    [gostivarCity setName:@"Gostivar"];
    [gostivarCity setTemperature:randTemp];
    [gostivarCity setImage:docDirSunnyImagePath];
    [tableViewArray addObject:gostivarCity];
    
    randTemp = arc4random_uniform(10) + 30;
    City *prilepCity = [[City alloc] init];
    [prilepCity setName:@"Prilep"];
    [prilepCity setTemperature:randTemp];
    [prilepCity setImage:docDirRainyImagePath];
    [tableViewArray addObject:prilepCity];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    [cell.textLabel setText:[[tableViewArray objectAtIndex: indexPath.row] name]];
    [cell.imageView setImage:[UIImage imageWithContentsOfFile:[[tableViewArray objectAtIndex: indexPath.row] image]]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%ld", (long)[[tableViewArray objectAtIndex: indexPath.row] temperature]]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    printf("didSelectRowAtIndexPath: %ld", indexPath.row);
}

-(IBAction)rightArrowButtonClick:(id)sender
{
    i++;
    if (i > 6)
    {
        i = 0;
    }
    [dayOfWeekLabel setText:daysOfWeek[i]];
}

-(IBAction)leftArrowButtonClick:(id)sender
{
    i--;
    if (i < 0)
    {
        i = 6;
    }
    [dayOfWeekLabel setText:daysOfWeek[i]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
