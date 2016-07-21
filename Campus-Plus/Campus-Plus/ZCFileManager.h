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

- (NSString *)getDocumentPathInUserDomains;
- (NSString *)getCachePathInUserDomains;

- (BOOL)moveFileAtPath:(NSString *)atPath toPath:(NSString *)toPath error:(NSError *)error;
- (BOOL)removeFilesAtCachePathIfError:(NSError *)error;

@end
