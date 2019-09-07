//
//  NSObject+YLKit.m
//  YLProject
//
//  Created by Conner on 2019/8/14.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "NSObject+YLKit.h"
#import <objc/runtime.h>

@implementation NSObject (YLKit)

//类名
+ (NSString *)className {
    return NSStringFromClass([self class]);
}

//获得所有变量
+ (NSArray *)getAllIvar:(id)object {
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList([object class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *keyChar = ivar_getName(ivar);
        NSString *keyStr = [NSString stringWithCString:keyChar encoding:NSUTF8StringEncoding];
        @try {
            id valueStr = [object valueForKey:keyStr];
            NSDictionary *dic = nil;
            if (valueStr) {
                dic = @{keyStr : valueStr};
            } else {
                dic = @{keyStr : @"值为nil"};
            }
            [array addObject:dic];
        }
        @catch (NSException *exception) {}
    }
    return [array copy];
}

//获得所有属性
+ (NSArray *)getAllProperty:(id)object {
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int count;
    objc_property_t *propertys = class_copyPropertyList([object class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        const char *nameChar = property_getName(property);
        NSString *nameStr = [NSString stringWithCString:nameChar encoding:NSUTF8StringEncoding];
        [array addObject:nameStr];
    }
    return [array copy];
}
@end
