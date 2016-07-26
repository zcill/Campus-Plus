//
//  ZCTabBarViewController.m
//  Campus-Plus
//
//  Created by 朱立焜 on 16/6/14.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "ZCTabBarViewController.h"
#import "BATabBarController.h"
#import "UIColor+ColorWithHex.h"

#import "ZCLoginViewController.h"
#import "ZCCourseTableViewController.h"

typedef NS_ENUM(NSInteger, BATabBarType) {
    BATabBarTypeWithText,
    BATabBarTypeNoText
};

@interface ZCTabBarViewController ()<BATabBarControllerDelegate>

@property (nonatomic, strong) BATabBarController *tabBarController;
@property (nonatomic, assign) BOOL firstTime;

@end

@implementation ZCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstTime = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    if(self.firstTime){
        
        BATabBarItem *tabBarItem, *tabBarItem2, *tabBarItem3, *tabBarItem4;
//        UIViewController *vc1 = [[UIViewController alloc] init];
        
        ZCLoginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCLoginViewController"];
        UINavigationController *loginNavi = [[UINavigationController alloc] initWithRootViewController:loginVC];
        
        ZCCourseTableViewController *courseVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ZCCourseTableViewController"];
        UINavigationController *courseNavi = [[UINavigationController alloc] initWithRootViewController:courseVC];
        
        UIViewController *vc3 = [[UIViewController alloc] init];
        UIViewController *vc4 = [[UIViewController alloc] init];
        
//        loginVC.view.backgroundColor = [UIColor colorWithHex:0x222B30];
//        courseVC.view.backgroundColor = [UIColor colorWithHex:0x222B30];
//        vc3.view.backgroundColor = [UIColor colorWithHex:0x222B30];
//        vc4.view.backgroundColor = [UIColor colorWithHex:0x222B30];
        
        loginVC.view.backgroundColor = [UIColor whiteColor];
        courseVC.view.backgroundColor = [UIColor whiteColor];
        
        tabBarItem = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"tabbar_home_unselected"]
                                           selectedImage:[UIImage imageNamed:@"tabbar_home_selected"]];
        
        tabBarItem2 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon1_unselected"]
                                            selectedImage:[UIImage imageNamed:@"icon1_selected"]];
        
        tabBarItem3 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon3_unselected"]
                                            selectedImage:[UIImage imageNamed:@"icon3_selected"]];
        
        tabBarItem4 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon2_unselected"]
                                            selectedImage:[UIImage imageNamed:@"icon2_selected"]];
        
        self.tabBarController = [[BATabBarController alloc] init];
        
        //tab bar background color example
        //        self.vc.tabBarBackgroundColor = [UIColor blackColor];
        
        //tab bar item stroke color example
        //        self.vc.tabBarItemStrokeColor = [UIColor blueColor];
        
        //Tab bar line width example
//                self.tabBarController.tabBarItemLineWidth = 1.0;
        
        self.tabBarController.viewControllers = @[loginNavi, courseNavi, vc3, vc4];
        self.tabBarController.tabBarItems = @[tabBarItem,tabBarItem2,tabBarItem3, tabBarItem4];
        [self.tabBarController setSelectedViewController:courseNavi animated:NO];
        
        self.tabBarController.delegate = self;
        [self.view addSubview:self.tabBarController.view];
        self.firstTime = NO;
        
    }
}

- (void)tabBarController:(BATabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"Delegate success!");
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
