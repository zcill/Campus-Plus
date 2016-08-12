//
//  CPCourse.h
//  Campus-Plus
//
//  Created by Locke on 16/8/12.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <MTLManagedObjectAdapter/MTLManagedObjectAdapter.h>

@interface CPCourse : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (copy, nonatomic, readonly) NSString *name;           /**< 课程名称 */
@property (copy, nonatomic, readonly) NSDate *atDate;           /**< 上课时间 */
@property (copy, nonatomic, readonly) NSNumber *duringTime;     /**< 上课持续时间 */
@property (copy, nonatomic, readonly) NSString *inClass;        /**< 上课班级 */
@property (copy, nonatomic, readonly) NSString *teacher;        /**< 教师 */

@end
