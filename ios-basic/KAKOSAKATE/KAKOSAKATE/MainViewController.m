//
//  MainViewController.m
//  KAKOSAKATE
//
//  Created by Denis Aleksandrov on 6/28/16.
//  Copyright © 2016 INform. All rights reserved.
//

//|   Cities          |
//---------------------
//[   Skopje      >   ]
//[   Kumanovo    >   ]
//[   Gostivar    >   ]

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "City.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    tableViewArray = [[NSMutableArray alloc] init];
    
    NSString *homeDirPath = NSHomeDirectory();
    printf("Home dir: %s\n", [homeDirPath UTF8String]);
    
    NSString *docDirSkopjeImagePath = [NSString stringWithFormat:@"%@/Documents/skopje.jpg", homeDirPath];
    
    NSString *docDirKumanovoImagePath = [NSString stringWithFormat:@"%@/Documents/kumanovo.jpg", homeDirPath];

    NSString *docDirGostivarImagePath = [NSString stringWithFormat:@"%@/Documents/gostivar.jpg", homeDirPath];
    
    NSString *docDirPrilepImagePath = [NSString stringWithFormat:@"%@/Documents/prilep.jpg", homeDirPath];
    
    City *skopjeCity = [[City alloc] init];
    [skopjeCity setName:@"Skopje"];
    [skopjeCity setDescription:@"Skopjem ipsum"];
    [skopjeCity setImage:docDirSkopjeImagePath];
    [skopjeCity setWebPage:@"https://en.wikipedia.org/wiki/Skopje"];
    [tableViewArray addObject:skopjeCity];
    
    City *kumanovoCity = [[City alloc] init];
    [kumanovoCity setName:@"Kumanovo"];
    [kumanovoCity setDescription:@"Kumanovem ipsum"];
    [kumanovoCity setImage:docDirKumanovoImagePath];
    [kumanovoCity setWebPage:@"https://en.wikipedia.org/wiki/Kumanovo"];
    [tableViewArray addObject:kumanovoCity];
    
    City *gostivarCity = [[City alloc] init];
    [gostivarCity setName:@"Gostivar"];
    [gostivarCity setDescription:@"Gostivarem ipsum"];
    [gostivarCity setImage:docDirGostivarImagePath];
    [gostivarCity setWebPage:@"https://en.wikipedia.org/wiki/Gostivar"];
    [tableViewArray addObject:gostivarCity];
    
    City *prilepCity = [[City alloc] init];
    [prilepCity setName:@"Prilep"];
    [prilepCity setDescription:@"Prilepem ipsum"];
    [prilepCity setImage:docDirPrilepImagePath];
    [prilepCity setWebPage:@"https://en.wikipedia.org/wiki/Prilep"];
    [tableViewArray addObject:prilepCity];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableViewArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell.textLabel setText:[[tableViewArray objectAtIndex: indexPath.row] name]];
    ////[cell.imageView setImage:[UIImage imageWithContentsOfFile:[[tableViewArray objectAtIndex: indexPath.row] image]]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    printf("didSelectRowAtIndexPath: %ld", indexPath.row);
    
    FirstViewController *myFirstViewController = [[FirstViewController alloc] init];
    City *tmp = [tableViewArray objectAtIndex:indexPath.row];
    /*
    [self presentViewController:myFirstViewController animated:YES completion:^{
        [self.view setBackgroundColor:[UIColor blueColor]];
    }];
    */
    [myFirstViewController setTitle:tmp.name];
    [myFirstViewController setFirstViewControllerCity:tmp];
    
    [self.navigationController pushViewController:myFirstViewController animated:YES];
}

- (IBAction)btnAction:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
