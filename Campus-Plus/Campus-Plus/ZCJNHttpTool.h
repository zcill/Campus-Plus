//
//  ZCJNHttpTool.h
//  Campus-Plus
//
//  Created by Zcill on 16/7/26.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCJNHttpTool : NSObject

- (NSMutableDictionary *)jxnu_getPostParamsWithStuNum:(NSString *)stuNum pwd:(NSString *)pwd;

@end
