//
//  CPCourse.m
//  Campus-Plus
//
//  Created by Locke on 16/8/12.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "CPCourse.h"

@implementation CPCourse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name" : @"name",
             @"atDate" : @"atDate",
             @"duringTime" : @"duringTime",
             @"inClass" : @"inClass",
             @"teacher" : @"teacher"
             };
}

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
    return @"CPCourse";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

@end
