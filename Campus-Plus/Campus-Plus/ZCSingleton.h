//
//  ZCSingleton.h
//
//  Created by 朱立焜 on 16/2/3.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

#ifndef ZCSingleton_h
#define ZCSingleton_h

// sharedInstance

#define singleton_sharedInstance_interface(className) + (className *)shared##className;

#define singleton_sharedInstance_implementation(className)\
static className *_instance;\
+(id)shared##className{\
if(!_instance){\
_instance=[[self alloc]init];\
}\
return _instance;\
}\
+(id)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t dispatchOnce;\
dispatch_once(&dispatchOnce, ^{\
_instance=[super allocWithZone:zone];\
});\
return _instance;\
}

// defaultInstance

#define singleton_defaultInstance_interface(className) + (className *)default##className;

#define singleton_defaultInstance_implementation(className)\
static className *_instance;\
+(id)default##className{\
if(!_instance){\
_instance=[[self alloc]init];\
}\
return _instance;\
}\
+(id)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t dispatchOnce;\
dispatch_once(&dispatchOnce, ^{\
_instance=[super allocWithZone:zone];\
});\
return _instance;\
}


#endif /* ZCSingleton_h */
