//
//  ZCFileManager.m
//  Campus-Plus
//
//  Created by zlk_meitu on 16/7/21.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "ZCFileManager.h"

@implementation ZCFileManager

singleton_defaultInstance_implementation(ZCFileManager)

// 获取documents目录路径
- (NSString *)getDocumentPathInUserDomains {
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

// 获取cache目录路径
- (NSString *)getCachePathInUserDomains {
    
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

// 移动单个文件到指定目录下
- (BOOL)moveFileAtPath:(NSString *)atPath toPath:(NSString *)toPath error:(NSError *)error {
    
    if (![[NSFileManager defaultManager] moveItemAtPath:atPath toPath:toPath error:&error]) {
        return YES;
    }
    return NO;
}

// 清除缓存目录下所有文件
- (BOOL)removeFilesAtCachePathIfError:(NSError *)error {
    
    if (![[NSFileManager defaultManager] removeItemAtPath:[self getCachePathInUserDomains] error:&error]) {
        return YES;
    }
    return NO;
}

@end
