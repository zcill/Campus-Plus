//
//  ZCJNHttpTool.m
//  Campus-Plus
//
//  Created by Zcill on 16/7/26.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "ZCJNHttpTool.h"
#import "ZCJxnuDefines.h"

@interface ZCJNHttpTool ()

@end

@implementation ZCJNHttpTool

singleton_sharedInstance_implementation(ZCJNHttpTool);

- (NSMutableDictionary *)jxnu_getPostParamsWithStuNum:(NSString *)stuNum pwd:(NSString *)pwd {
    
    return [NSMutableDictionary dictionaryWithDictionary:@{
                                                           @"__EVENTTARGET":@"",
                                                           @"__LASTFOCUS":@"",
                                                           @"__VIEWSTATE":JXNU_VIEWSTATE,
                                                           @"__EVENTVALIDATION":JXNU_EVENTVALIDATION,
                                                           @"rblUserType":@"Student",
                                                           @"ddlCollege":@"180     ",
                                                           @"StuNum":stuNum,
                                                           @"TeaNum":@"",
                                                           @"Password":pwd,
                                                           @"login":@"登录"
                                                           }];
    
}

- (void)jxnu_loginWithStuUsername:(NSString *)username
                      stuPassword:(NSString *)stuPassword
                          success:(successCompletion)success
                          failure:(failureCompletion)failure {
    
    if ([username isEqualToString:@""] || [stuPassword isEqualToString:@""]) {
        failure(ZCJxnuLoginEmptyValue);
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:JxnuJwcLoginUrl
       parameters:[self jxnu_getPostParamsWithStuNum:username pwd:stuPassword]
         progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            if ([string containsString:@"欢迎您"]) {
                self.isLogin = YES;
                success();
            } else {
                self.isLogin = NO;
                failure(ZCJxnuLoginNotMatch);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            self.isLogin = NO;
            failure(ZCJxnuLoginOtherError);
        }];
    
}

// cookie 相关
- (NSArray *)jxnu_getLoginCookies {

    return [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:JxnuJwcOfficalUrl]];
}

// logout
- (void)jxnu_logoutWithSuccessCompletion:(void (^)())successCompletion failure:(void (^)())failure {
    
    if ([self jxnu_isLogin]) {
        
        NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        NSArray *cookies = [cookieJar cookiesForURL:[NSURL URLWithString:JxnuJwcOfficalUrl]];
        
        for (NSHTTPCookie *cookie in cookies) {
            [cookieJar deleteCookie:cookie];
        }
        self.isLogin = NO;
        successCompletion();
        
    } else {
        
        failure();
    }
    
}

@end
