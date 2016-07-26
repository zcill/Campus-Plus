//
//  ZCJxnuDefines.h
//  Campus-Plus
//
//  Created by Zcill on 16/7/26.
//  Copyright © 2016年 zcill. All rights reserved.
//

#ifndef ZCJxnuDefines_h
#define ZCJxnuDefines_h

#pragma mark - >>>>>>>>>>>>> 导入三方库

#import <Realm/Realm.h>
#import <ChameleonFramework/Chameleon.h>

#pragma mark - >>>>>>>>>>>>> 常量宏

// LeanCloud初始化
#define LeanCloudAppID @"可以在Leancloud自己申请一个填进去"
#define LeanCloudAppKey @"可以在Leancloud自己申请一个填进去"

// Umeng AppKey
#define UmengAppKey @"可以在友盟自己申请"

// 网络状态监听
#define noNetworkString @"无网络连接"
#define WWANString @"正在使用蜂窝数据"
#define WiFiString @"正在使用WiFi"

// 登录错误信息
#define LogInErrorMobile @"请输入正确的手机号码"
#define LogInErrorPassword @"密码不能为空"
#define LogInErrorUser @"请使用指定帐号登录"
#define LogInErrorPwdNotMatch @"用户名或密码不正确"
#define LogInErrorTimeOut @"网络请求超时"

// 指纹识别错误信息
#define TouchIDNotEnrolled @"此设备未录入指纹信息!"
#define TouchIDNotAvailable @"此设备不支持Touch ID!"
#define TouchIDPasscodeNotSet @"未设置密码,无法开启认证!"
#define TouchIDSystemCancel @"系统取消认证"
#define TouchIDUserFallback @"选择输入密码!"
#define TouchIDUserCancel @"用户取消认证!"
#define TouchIDAuthenticationFailed @"用户认证失败!"

// 匹配登录信息的正则表达式
#define passwordPredicate @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}"
#define mobilePredicate @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$"

// 通知相关
#define NotificationChangeUserAccount @"Change_User_Account"
#define NotificationDismissLoginView @"Dismiss_Login_View"

#pragma mark - >>>>>>>>>>>>> 宽高宏

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#pragma mark - >>>>>>>>>>>>> 颜色宏

#define pieRedColor [UIColor colorWithRed:0.871 green:0.208 blue:0.180 alpha:1.000]
#define pieOrangeColor [UIColor colorWithRed:0.941 green:0.588 blue:0.110 alpha:1.000]
#define pieYellowColor [UIColor colorWithRed:0.929 green:0.655 blue:0.141 alpha:1.000]
#define pieGreenColor [UIColor colorWithRed:0.396 green:0.812 blue:0.396 alpha:1.000]
#define pieBlueColor [UIColor colorWithRed:0.294 green:0.616 blue:0.914 alpha:1.000]


#pragma mark - >>>>>>>>>>>>> 打印宏

// DLog will output like NSLog only when the DEBUG variable is set

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#else
#define DLog(...)

#endif

// ALog will always output like NSLog

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

// ULog will show the UIAlertView only when the DEBUG variable is set

#ifdef DEBUG
#define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }

#else
#define ULog(...)

#endif

#define CRToastOptionsWithInfo(info) @{\
kCRToastTextKey : info,\
kCRToastNotificationTypeKey : @(CRToastTypeNavigationBar),\
kCRToastNotificationPresentationTypeKey : @(CRToastPresentationTypeCover),\
kCRToastTextAlignmentKey : @(NSTextAlignmentCenter),\
kCRToastBackgroundColorKey : [UIColor redColor],\
kCRToastAnimationInTypeKey : @(CRToastAnimationTypeGravity),\
kCRToastAnimationOutTypeKey : @(CRToastAnimationTypeLinear),\
kCRToastAnimationInDirectionKey : @(CRToastAnimationDirectionTop),\
kCRToastAnimationOutDirectionKey : @(CRToastAnimationDirectionTop)\
}

// 访问 jxnu.edu.cn 前需要携带过去的参数
#define JXNU_VIEWSTATE @"/wEPDwUJNjk1MjA1MTY0D2QWAgIBD2QWBAIBDxYCHgdWaXNpYmxlZxYEZg8QZGQWAWZkAgEPEA8WBh4NRGF0YVRleHRGaWVsZAUM5Y2V5L2N5ZCN56ewHg5EYXRhVmFsdWVGaWVsZAUJ5Y2V5L2N5Y+3HgtfIURhdGFCb3VuZGdkEBU/CeS/neWNq+WkhAnotKLliqHlpIQS6LSi5pS/6YeR6J6N5a2m6ZmiEuaIkOS6uuaVmeiCsuWtpumZohLln47luILlu7rorr7lrabpmaIS5Yid562J5pWZ6IKy5a2m6ZmiDOS8oOaSreWtpumZoiHlvZPku6PlvaLmgIHmlofoibrlrabnoJTnqbbkuK3lv4MP5YWa5Yqe44CB5qCh5YqeCeaho+ahiOmmhhXlnLDnkIbkuI7njq/looPlrabpmaIb5a+55aSW6IGU57uc5LiO5o6l5b6F5Lit5b+DGOmrmOetieaVmeiCsueglOeptuS4reW/gxjlm73pmYXlkIjkvZzkuI7kuqTmtYHlpIQS5Zu96ZmF5pWZ6IKy5a2m6ZmiD+WQjuWLpOS/nemanOWkhBjljJblt6XlvIDlj5HnoJTnqbbkuK3lv4MS5YyW5a2m5YyW5bel5a2m6ZmiCeWfuuW7uuWkhBvorqHnrpfmnLrkv6Hmga/lt6XnqIvlrabpmaIq5rGf6KW/55yB5YWJ55S15a2Q5LiO6YCa5L+h6YeN54K55a6e6aqM5a6kD+aVmeW4iOaVmeiCsuWkhAnmlZnliqHlpIQM5pWZ6IKy5a2m6ZmiD+WGm+S6i+aVmeeglOWupBLnp5HmioDjgIHnpL7np5HlpIQS56eR5a2m5oqA5pyv5a2m6ZmiGOivvueoi+S4juaVmeWtpueglOeptuaJgBjnprvpgIDkvJHlt6XkvZzlip7lhazlrqQS55CG5YyW5rWL6K+V5Lit5b+DG+WOhuWPsuaWh+WMluS4juaXhea4uOWtpumZogznvo7mnK/lrabpmaIS5YWN6LS55biI6IyD55Sf6ZmiEuS6uuaJjeS6pOa1geS4reW/gwnkurrkuovlpIQM6L2v5Lu25a2m6ZmiCeWVhuWtpumZohvorr7lpIfkuI7lrp7pqozlrqTnrqHnkIblpIQS55Sf5ZG956eR5a2m5a2m6ZmiEuW4iOi1hOWfueiureS4reW/gxvmlbDlrabkuI7kv6Hmga/np5HlrablrabpmaIS57Sg6LSo5pWZ6IKy5Lit5b+DDOS9k+iCsuWtpumZognlm77kuabppoYP5aSW5Zu96K+t5a2m6ZmiHuWkluexjeS4k+WutueuoeeQhuacjeWKoeS4reW/gxLlpJbor63ogIPor5XkuK3lv4MP5paH5YyW56CU56m26ZmiCeaWh+WtpumZohvniannkIbkuI7pgJrkv6HnlLXlrZDlrabpmaIe546w5Luj5pWZ6IKy5oqA5pyv5bqU55So5Lit5b+DFeagoeWPi+W3peS9nOWKnuWFrOWupBXmoKHlm63nvZHnrqHnkIbkuK3lv4MM5b+D55CG5a2m6ZmiEuaWsOmXu+S/oeaBr+S4reW/gw/lrabmiqXmnYLlv5fnpL4P5a2m56eR5bu66K6+5aSECeWtpueUn+WkhAznoJTnqbbnlJ/pmaIS6Im65pyv56CU56m25Lit5b+DDOmfs+S5kOWtpumZog/mi5vnlJ/lsLHkuJrlpIQM5pS/5rOV5a2m6ZmiFT8IMTgwICAgICAIMTcwICAgICAINjgwMDAgICAINDUwICAgICAINjMwMDAgICAIODIwMDAgICAINjQwMDAgICAIMzgyICAgICAIMTMwICAgICAIMTA5ICAgICAINDgwMDAgICAIMTMyICAgICAIMzkwICAgICAIMTYwICAgICAINjkwMDAgICAIODcwMDAgICAIMzY1ICAgICAINjEwMDAgICAIMTQ0ICAgICAINjIwMDAgICAIMzgxICAgICAIMjUwICAgICAIMjQwMDAgICAINTAwMDAgICAIMzcwMDAgICAIMTQwICAgICAIODEwMDAgICAIMzI0ICAgICAIMTA0ICAgICAIMzIwICAgICAINTgwMDAgICAINjUwMDAgICAINTcwMDAgICAIMzMwICAgICAIMTUwICAgICAINjcwMDAgICAINTQwMDAgICAIMzYwICAgICAINjYwMDAgICAIMzEwICAgICAINTUwMDAgICAIMzgwMDAgICAINTYwMDAgICAIMjkwICAgICAINTIwMDAgICAIODkwMDAgICAIMzAwICAgICAIMzUwICAgICAINTEwMDAgICAINjAwMDAgICAIMzYxICAgICAIMTg5ICAgICAIMzA0ICAgICAINDkwMDAgICAIMTA2ICAgICAINDIwICAgICAIMTM2ICAgICAIMTEwICAgICAIMTkwICAgICAIMTQ2ICAgICAINTMwMDAgICAINDQwICAgICAINTkwMDAgICAUKwM/Z2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZGQCAw8PFgIfAGhkFgQCAQ8PFgIeCEltYWdlVXJsBUBNeUNvbnRyb2wvQWxsX1Bob3RvU2hvdy5hc3B4P1VzZXJOdW09MTMwODA5NTA3OCZVc2VyVHlwZT1TdHVkZW50ZGQCAw8PFgIeBFRleHQFnQHmrKLov47mgqjvvIzlkLTlkK/kuJw8YnI+PGEgdGFyZ2V0PV9ibGFuayBocmVmPU15Q29udHJvbC9TdHVkZW50X0luZm9yQ2hlY2suYXNweD48c3Ryb25nPjxmb250IGNvbG9yPXJlZCBzaXplPTM+5qCh5a+55Liq5Lq65L+h5oGvPC9mb250PjwvZm9udD48L3N0cm9uZz48L2E+ZGQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgEFClJlbWVuYmVyTWVL9DEQwq27B1OYvZ515c+Dw2RwqwMstx3xyKGTxh2WIA=="

#define JXNU_EVENTVALIDATION @"/wEWSgLYl4WMBgLr6+/kCQK3yfbSBAKDspbeCQL21fViApC695MMAsjQmpEOAsjQpo4OAv3S2u0DAq/RroAOAv3S9t4DAqPW8tMDAv3S6tEDAoSwypgNAsjQtoIOArWVmJEHAr/R2u0DAsaw5o0NAo7QnpwOAsjQooMOAv3S3ugDAqPW5toDArfW7mMC/dL+0AMCvJDK9wsC/dLy0wMCw5aHjwMC6dGugA4C+dHq0QMC3NH61QMCntDm2gMCyNCqhQ4Co9b+0AMC8pHSiQwCvJDaiwwCjtCyhw4C3NHa7QMC/dLu3AMC3NHm2gMCjtC2gg4CyNCugA4C/dLm2gMC3NHq0QMCjtCigw4C/dLi3wMCjtC+hA4C3NHu3AMCntDa7QMC3NHi3wMC6dGenA4C3NHy0wMCo9be6AMCjtC6mQ4CjtCugA4C3NH+0AMC/dL61QMCw5bP/gICtZX4qQcC8pHaiwwCv9He6AMCqvCJ9QoCr9Gyhw4CqvCF/goCyNC+hA4CyNCenA4CqvC58QoC3NH23gMCr9GqhQ4C3NHe6AMC+euUqg4C2tqumwgC0sXgkQ8CuLeX+QECj8jxgAoP0m8Sj7LwLyeNyl7ka0HEgwkEhTIbhgvRBFELqH13qw=="

#endif /* ZCJxnuDefines_h */
