//
//  GBMSquareViewController.m
//  GBMoran_iOS
//
//  Created by 柴勇峰 on 8/9/15.
//  Copyright (c) 2015 Brave. All rights reserved.
//

#import "GBMSquareViewController.h"
#import "GBMSquareCell.h"

@interface GBMSquareViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray *scrollArray;
@end

@implementation GBMSquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.title = @"附近1000米";
    
    self.scrollArray = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"squareCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    return cell;
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
