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

typedef NS_ENUM(NSInteger, BATabBarType) {
    BATabBarTypeWithText,
    BATabBarTypeNoText
};

@interface ZCTabBarViewController ()<BATabBarControllerDelegate>

@property (nonatomic, assign) BATabBarType demoType;
@property (nonatomic, strong) BATabBarController *tabBarController;
@property (nonatomic, assign) BOOL firstTime;

@end

@implementation ZCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstTime = YES;
    
    //for easy swtiching between demos
    self.demoType = BATabBarTypeNoText;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    if(self.firstTime){
        
        BATabBarItem *tabBarItem, *tabBarItem2, *tabBarItem3;
        UIViewController *vc1 = [[UIViewController alloc] init];
        UIViewController *vc2 = [[UIViewController alloc] init];
        UIViewController *vc3 = [[UIViewController alloc] init];
        vc1.view.backgroundColor = [UIColor colorWithHex:0x222B30];
        vc2.view.backgroundColor = [UIColor colorWithHex:0x222B30];
        vc3.view.backgroundColor = [UIColor colorWithHex:0x222B30];
        
        
        
        switch (self.demoType) {
            case BATabBarTypeWithText: {
                NSMutableAttributedString *option1 = [[NSMutableAttributedString alloc] initWithString:@"Feed"];
                [option1 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:0xF0F2F6] range:NSMakeRange(0,option1.length)];
                
                tabBarItem = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon1_unselected"] selectedImage:[UIImage imageNamed:@"icon1_selected"] title:option1];
                
                NSMutableAttributedString *option2 = [[NSMutableAttributedString alloc] initWithString:@"Home"];
                [option2 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:0xF0F2F6] range:NSMakeRange(0,option2.length)];
                
                tabBarItem2 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon2_unselected"] selectedImage:[UIImage imageNamed:@"icon2_selected"] title:option2];
                
                NSMutableAttributedString * option3 = [[NSMutableAttributedString alloc] initWithString:@"Profile"];
                [option3 addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHex:0xF0F2F6] range:NSMakeRange(0,option3.length)];
                
                tabBarItem3 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon3_unselected"] selectedImage:[UIImage imageNamed:@"icon3_selected"] title:option3];
                break;
            }
            case BATabBarTypeNoText: {
                tabBarItem = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon1_unselected"] selectedImage:[UIImage imageNamed:@"icon1_selected"]];
                
                tabBarItem2 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon2_unselected"] selectedImage:[UIImage imageNamed:@"icon2_selected"]];
                
                tabBarItem3 = [[BATabBarItem alloc] initWithImage:[UIImage imageNamed:@"icon3_unselected"] selectedImage:[UIImage imageNamed:@"icon3_selected"]];
                break;
            }
                
            default:
                //what are you doing here?
                break;
                
        }
        
        self.tabBarController = [[BATabBarController alloc] init];
        
        //tab bar background color example
        //        self.vc.tabBarBackgroundColor = [UIColor blackColor];
        
        //tab bar item stroke color example
        //        self.vc.tabBarItemStrokeColor = [UIColor blueColor];
        
        //Tab bar line width example
        //        self.vc.tabBarItemLineWidth = 1.0;
        
        self.tabBarController.viewControllers = @[vc1,vc2,vc3];
        self.tabBarController.tabBarItems = @[tabBarItem,tabBarItem2,tabBarItem3];
        [self.tabBarController setSelectedViewController:vc2 animated:NO];
        
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
