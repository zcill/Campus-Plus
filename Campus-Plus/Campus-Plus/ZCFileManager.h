//
//  ZCFileManager.h
//  Campus-Plus
//
//  Created by zlk_meitu on 16/7/21.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCSingleton.h"

@interface ZCFileManager : NSObject

singleton_defaultInstance_interface(ZCFileManager)

/**
 *  获取沙盒Documents目录
 *
 *  @return Documents目录的路径
 */
- (NSString *)getDocumentPathInUserDomains;

/**
 *  获取沙盒Cache目录
 *
 *  @return Cache目录的路径
 */
- (NSString *)getCachePathInUserDomains;

/**
 *  移动文件
 *
 *  @param atPath 文件原始路径
 *  @param toPath 移动文件的目标路径
 *  @param error  出现错误
 *
 *  @return 是否移动成功
 */
- (BOOL)moveFileAtPath:(NSString *)atPath toPath:(NSString *)toPath error:(NSError *)error;

/**
 *  删除文件
 *
 *  @param error 删除错误
 *
 *  @return 是否删除成功
 */
- (BOOL)removeFilesAtCachePathIfError:(NSError *)error;

@end
