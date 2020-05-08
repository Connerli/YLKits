//
//  NSObject+YLMethodSwizzling.m
//  YLKits
//
//  Created by Conner on 2020/4/27.
//  Copyright © 2020 Conner. All rights reserved.
//

#import "NSObject+YLMethodSwizzling.h"
#import <objc/runtime.h>

@implementation NSObject (YLMethodSwizzling)

// 交换两个类方法的实现
+ (void)yl_swizzlingClassMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector {
    Class targetClass = [self class];
    swizzlingClassMethod(targetClass, originalSelector, swizzledSelector);
}

// 交换两个对象方法的实现
+ (void)yl_swizzlingInstanceMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector {
    Class targetClass = [self class];
    swizzlingInstanceMethod(targetClass, originalSelector, swizzledSelector);
}

// 交换两个类方法的实现 C 函数
void swizzlingClassMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

// 交换两个对象方法的实现 C 函数
void swizzlingInstanceMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
