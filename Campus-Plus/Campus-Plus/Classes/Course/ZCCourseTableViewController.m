//
//  ZCCourseTableViewController.m
//  Campus-Plus
//
//  Created by zlk_meitu on 16/6/15.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "ZCCourseTableViewController.h"
#import "ZCJNHttpTool.h"

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

#pragma mark - public method

#pragma mark - HeaderView button Action

- (IBAction)checkUserIsAlreadyLoginWithButton:(UIButton *)sender {
    
    if (![ZCJNHttpTool sharedZCJNHttpTool].jxnu_isLogin) {
        
        // 未登录
        // 弹出登录ViewController
        
    } else {
        
        // user is already login
        if ([sender.currentTitle isEqualToString:@"课表"]) {
            
            NSLog(@"course, sender title: %@", sender.currentTitle);
            
        } else if ([sender.currentTitle isEqualToString:@"考试"]) {
            
            NSLog(@"exam, sender title: %@", sender.currentTitle);
            
        } else if ([sender.currentTitle isEqualToString:@"成绩"]) {
            
            NSLog(@"score, sender title: %@", sender.currentTitle);
            
        }
        
    }
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZCCourseCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = @"Test Test Test";
    
    return cell;
}

@end
