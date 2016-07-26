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

@property (nonatomic, strong) NSMutableDictionary *jxnu_postParams;

@end

@implementation ZCJNHttpTool

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

@end
