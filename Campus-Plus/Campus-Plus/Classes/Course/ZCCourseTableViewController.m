//
//  ZCCourseTableViewController.m
//  Campus-Plus
//
//  Created by zlk_meitu on 16/6/15.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "ZCCourseTableViewController.h"

@interface ZCCourseTableViewController ()

@end

@implementation ZCCourseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZCCourseCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    return cell;
}

@end
