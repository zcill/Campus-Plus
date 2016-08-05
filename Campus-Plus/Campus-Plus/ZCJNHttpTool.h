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

/**
 *  单例
 */
singleton_sharedInstance_interface(ZCJNHttpTool);

/**
 *  用户是否登录
 */
@property (nonatomic, assign, getter=jxnu_isLogin) BOOL isLogin;     /** 是否登录 */

/**
 *  获取登录时需要传递的参数的值(默认写死)
 *
 *  @param stuNum 学号
 *  @param pwd    密码
 *
 *  @return 参数用字典包起来返回
 */
- (NSMutableDictionary *)jxnu_getPostParamsWithStuNum:(NSString *)stuNum pwd:(NSString *)pwd;

/**
 *  发送登录请求
 *  登录原理：用浏览器登录，把cookie保存，假装已经登录，登出就清除cookie
 *
 *  @param username    用户名/学号
 *  @param stuPassword 密码
 *  @param success     登录成功回调
 *  @param failure     登录失败回调
 */
- (void)jxnu_loginWithStuUsername:(NSString *)username
                      stuPassword:(NSString *)stuPassword
                          success:(successCompletion)success
                          failure:(failureCompletion)failure;

/**
 *  发送登出请求
 *  登出原理：清除cookies
 *
 *  @param successCompletion 登出成功回调
 *  @param failure           登出失败回调
 */
- (void)jxnu_logoutWithSuccessCompletion:(void (^)())successCompletion failure:(void (^)())failure;

@end
