//
//  ZCLoginViewController.m
//  Campus-Plus
//
//  Created by zlk_meitu on 16/6/22.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "ZCLoginViewController.h"

@interface ZCLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic, strong) NSMutableDictionary *postParams;

@end

@implementation ZCLoginViewController

- (IBAction)webButton:(UIButton *)sender {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://jwc.jxnu.edu.cn/User/default.aspx?&&code=111&uctl=MyControl%5cxfz_kcb.ascx&MyAction=Personal"]]];    
}

- (NSMutableDictionary *)postParams {
    return [NSMutableDictionary dictionaryWithDictionary:@{
                                                           @"__EVENTTARGET":@"",
                                                           @"__LASTFOCUS":@"",
                                                           @"__VIEWSTATE":@"/wEPDwUJNjk1MjA1MTY0D2QWAgIBD2QWBAIBDxYCHgdWaXNpYmxlZxYEZg8QZGQWAWZkAgEPEA8WBh4NRGF0YVRleHRGaWVsZAUM5Y2V5L2N5ZCN56ewHg5EYXRhVmFsdWVGaWVsZAUJ5Y2V5L2N5Y+3HgtfIURhdGFCb3VuZGdkEBU/CeS/neWNq+WkhAnotKLliqHlpIQS6LSi5pS/6YeR6J6N5a2m6ZmiEuaIkOS6uuaVmeiCsuWtpumZohLln47luILlu7rorr7lrabpmaIS5Yid562J5pWZ6IKy5a2m6ZmiDOS8oOaSreWtpumZoiHlvZPku6PlvaLmgIHmlofoibrlrabnoJTnqbbkuK3lv4MP5YWa5Yqe44CB5qCh5YqeCeaho+ahiOmmhhXlnLDnkIbkuI7njq/looPlrabpmaIb5a+55aSW6IGU57uc5LiO5o6l5b6F5Lit5b+DGOmrmOetieaVmeiCsueglOeptuS4reW/gxjlm73pmYXlkIjkvZzkuI7kuqTmtYHlpIQS5Zu96ZmF5pWZ6IKy5a2m6ZmiD+WQjuWLpOS/nemanOWkhBjljJblt6XlvIDlj5HnoJTnqbbkuK3lv4MS5YyW5a2m5YyW5bel5a2m6ZmiCeWfuuW7uuWkhBvorqHnrpfmnLrkv6Hmga/lt6XnqIvlrabpmaIq5rGf6KW/55yB5YWJ55S15a2Q5LiO6YCa5L+h6YeN54K55a6e6aqM5a6kD+aVmeW4iOaVmeiCsuWkhAnmlZnliqHlpIQM5pWZ6IKy5a2m6ZmiD+WGm+S6i+aVmeeglOWupBLnp5HmioDjgIHnpL7np5HlpIQS56eR5a2m5oqA5pyv5a2m6ZmiGOivvueoi+S4juaVmeWtpueglOeptuaJgBjnprvpgIDkvJHlt6XkvZzlip7lhazlrqQS55CG5YyW5rWL6K+V5Lit5b+DG+WOhuWPsuaWh+WMluS4juaXhea4uOWtpumZogznvo7mnK/lrabpmaIS5YWN6LS55biI6IyD55Sf6ZmiEuS6uuaJjeS6pOa1geS4reW/gwnkurrkuovlpIQM6L2v5Lu25a2m6ZmiCeWVhuWtpumZohvorr7lpIfkuI7lrp7pqozlrqTnrqHnkIblpIQS55Sf5ZG956eR5a2m5a2m6ZmiEuW4iOi1hOWfueiureS4reW/gxvmlbDlrabkuI7kv6Hmga/np5HlrablrabpmaIS57Sg6LSo5pWZ6IKy5Lit5b+DDOS9k+iCsuWtpumZognlm77kuabppoYP5aSW5Zu96K+t5a2m6ZmiHuWkluexjeS4k+WutueuoeeQhuacjeWKoeS4reW/gxLlpJbor63ogIPor5XkuK3lv4MP5paH5YyW56CU56m26ZmiCeaWh+WtpumZohvniannkIbkuI7pgJrkv6HnlLXlrZDlrabpmaIe546w5Luj5pWZ6IKy5oqA5pyv5bqU55So5Lit5b+DFeagoeWPi+W3peS9nOWKnuWFrOWupBXmoKHlm63nvZHnrqHnkIbkuK3lv4MM5b+D55CG5a2m6ZmiEuaWsOmXu+S/oeaBr+S4reW/gw/lrabmiqXmnYLlv5fnpL4P5a2m56eR5bu66K6+5aSECeWtpueUn+WkhAznoJTnqbbnlJ/pmaIS6Im65pyv56CU56m25Lit5b+DDOmfs+S5kOWtpumZog/mi5vnlJ/lsLHkuJrlpIQM5pS/5rOV5a2m6ZmiFT8IMTgwICAgICAIMTcwICAgICAINjgwMDAgICAINDUwICAgICAINjMwMDAgICAIODIwMDAgICAINjQwMDAgICAIMzgyICAgICAIMTMwICAgICAIMTA5ICAgICAINDgwMDAgICAIMTMyICAgICAIMzkwICAgICAIMTYwICAgICAINjkwMDAgICAIODcwMDAgICAIMzY1ICAgICAINjEwMDAgICAIMTQ0ICAgICAINjIwMDAgICAIMzgxICAgICAIMjUwICAgICAIMjQwMDAgICAINTAwMDAgICAIMzcwMDAgICAIMTQwICAgICAIODEwMDAgICAIMzI0ICAgICAIMTA0ICAgICAIMzIwICAgICAINTgwMDAgICAINjUwMDAgICAINTcwMDAgICAIMzMwICAgICAIMTUwICAgICAINjcwMDAgICAINTQwMDAgICAIMzYwICAgICAINjYwMDAgICAIMzEwICAgICAINTUwMDAgICAIMzgwMDAgICAINTYwMDAgICAIMjkwICAgICAINTIwMDAgICAIODkwMDAgICAIMzAwICAgICAIMzUwICAgICAINTEwMDAgICAINjAwMDAgICAIMzYxICAgICAIMTg5ICAgICAIMzA0ICAgICAINDkwMDAgICAIMTA2ICAgICAINDIwICAgICAIMTM2ICAgICAIMTEwICAgICAIMTkwICAgICAIMTQ2ICAgICAINTMwMDAgICAINDQwICAgICAINTkwMDAgICAUKwM/Z2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZGQCAw8PFgIfAGhkFgQCAQ8PFgIeCEltYWdlVXJsBUBNeUNvbnRyb2wvQWxsX1Bob3RvU2hvdy5hc3B4P1VzZXJOdW09MTMwODA5NTA3OCZVc2VyVHlwZT1TdHVkZW50ZGQCAw8PFgIeBFRleHQFnQHmrKLov47mgqjvvIzlkLTlkK/kuJw8YnI+PGEgdGFyZ2V0PV9ibGFuayBocmVmPU15Q29udHJvbC9TdHVkZW50X0luZm9yQ2hlY2suYXNweD48c3Ryb25nPjxmb250IGNvbG9yPXJlZCBzaXplPTM+5qCh5a+55Liq5Lq65L+h5oGvPC9mb250PjwvZm9udD48L3N0cm9uZz48L2E+ZGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFClJlbWVuYmVyTWVL9DEQwq27B1OYvZ515c+Dw2RwqwMstx3xyKGTxh2WIA==",
                                                           @"__EVENTVALIDATION":@"/wEWSgLYl4WMBgLr6+/kCQK3yfbSBAKDspbeCQL21fViApC695MMAsjQmpEOAsjQpo4OAv3S2u0DAq/RroAOAv3S9t4DAqPW8tMDAv3S6tEDAoSwypgNAsjQtoIOArWVmJEHAr/R2u0DAsaw5o0NAo7QnpwOAsjQooMOAv3S3ugDAqPW5toDArfW7mMC/dL+0AMCvJDK9wsC/dLy0wMCw5aHjwMC6dGugA4C+dHq0QMC3NH61QMCntDm2gMCyNCqhQ4Co9b+0AMC8pHSiQwCvJDaiwwCjtCyhw4C3NHa7QMC/dLu3AMC3NHm2gMCjtC2gg4CyNCugA4C/dLm2gMC3NHq0QMCjtCigw4C/dLi3wMCjtC+hA4C3NHu3AMCntDa7QMC3NHi3wMC6dGenA4C3NHy0wMCo9be6AMCjtC6mQ4CjtCugA4C3NH+0AMC/dL61QMCw5bP/gICtZX4qQcC8pHaiwwCv9He6AMCqvCJ9QoCr9Gyhw4CqvCF/goCyNC+hA4CyNCenA4CqvC58QoC3NH23gMCr9GqhQ4C3NHe6AMC+euUqg4C2tqumwgC0sXgkQ8CuLeX+QECj8jxgAoP0m8Sj7LwLyeNyl7ka0HEgwkEhTIbhgvRBFELqH13qw==",
                                                           @"rblUserType":@"Student",
                                                           @"ddlCollege":@"180     ",
                                                           @"StuNum":self.usernameTextField.text,
                                                           @"TeaNum":@"",
                                                           @"Password":self.passwordTextField.text,
                                                           @"login":@"登录"
                                                           }];
}

- (IBAction)logout:(UIButton *)sender {
    
    [self deleteCookies];
    
}

- (IBAction)login:(UIButton *)sender {
    [self showIndicatorView];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:@"http://jwc.jxnu.edu.cn/Default_Login.aspx?preurl="
       parameters:self.postParams
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
             NSLog(@"progress: %@", uploadProgress);
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             
             NSLog(@"success! task: %@, responseObject: %@", task, responseObject);
             [self hideIndicatorView];
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             
             NSLog(@"failure! task: %@, error: %@", task, error);
         }
     ];
}

- (void)deleteCookies {
    
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = [cookieJar cookiesForURL: [NSURL URLWithString:@"http://jwc.jxnu.edu.cn"]];
    
    for (NSHTTPCookie *cookie in cookies) {
        NSLog(@"cookieName: %@", [cookie name]);
        [cookieJar deleteCookie:cookie];
    }
    
    NSLog(@"cookies: %@", cookies);
    
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
