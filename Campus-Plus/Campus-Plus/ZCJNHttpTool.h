//
//  ZCJNHttpTool.h
//  Campus-Plus
//
//  Created by Zcill on 16/7/26.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "ZCSingleton.h"

typedef enum : NSUInteger {
    ZCJxnuLoginEmptyValue = 0,  // 帐号或密码为空
    ZCJxnuLoginNotMatch,        // 帐号密码不匹配
    ZCJxnuLoginOtherError,
} ZCJxnuLoginError;

typedef void(^loginProgress)(NSProgress *uploadProgress);
typedef void(^successCompletion)();
typedef void(^failureCompletion)(ZCJxnuLoginError error);

@interface ZCJNHttpTool : NSObject

singleton_sharedInstance_interface(ZCJNHttpTool);

@property (nonatomic, assign, getter=jxnu_isLogin) BOOL isLogin;     /** 是否登录 */

- (NSMutableDictionary *)jxnu_getPostParamsWithStuNum:(NSString *)stuNum pwd:(NSString *)pwd;

- (void)jxnu_loginWithStuUsername:(NSString *)username
                      stuPassword:(NSString *)stuPassword
                          success:(successCompletion)success
                          failure:(failureCompletion)failure;

- (void)jxnu_logoutWithSuccessCompletion:(void (^)())successCompletion failure:(void (^)())failure;

@end
