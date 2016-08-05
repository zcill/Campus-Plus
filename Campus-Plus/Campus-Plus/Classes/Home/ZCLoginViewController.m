//
//  ZCLoginViewController.m
//  Campus-Plus
//
//  Created by zlk_meitu on 16/6/22.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "ZCLoginViewController.h"
#import "ZCJxnuDefines.h"
#import "ZCJNHttpTool.h"

@interface ZCLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ZCLoginViewController

- (IBAction)webButton:(UIButton *)sender {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:JxnuJwcCourseUrl]]];
}

- (IBAction)logout:(UIButton *)sender {
    
    [[ZCJNHttpTool sharedZCJNHttpTool] jxnu_logoutWithSuccessCompletion:^{
        
        NSLog(@"logout success");
        
    } failure:^{
        
        NSLog(@"logout failure");
    }];
    
}

- (IBAction)login:(UIButton *)sender {
    
    [[ZCJNHttpTool sharedZCJNHttpTool] jxnu_loginWithStuUsername:self.usernameTextField.text
                                                     stuPassword:self.passwordTextField.text
                                                         success:^{
                                                             NSLog(@"登录成功");
                                                         } failure:^(ZCJxnuLoginError error) {
                                                             
                                                         }];
    
}

- (void)showIndicatorView {
    
    [self.indicatorView startAnimating];
    [self.loginLabel setHidden:NO];
    
}

- (void)hideIndicatorView {
    
    [self.indicatorView stopAnimating];
    [self.loginLabel setHidden:YES];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.loginLabel setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
