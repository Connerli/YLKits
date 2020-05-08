//
//  NSObject+YLForwarding.m
//  YLKits
//
//  Created by Conner on 2020/4/27.
//  Copyright © 2020 Conner. All rights reserved.
//

#import "NSObject+YLForwarding.h"
#import "YLForwardingTarget.h"
#import <objc/runtime.h>

static YLForwardingTarget *_target = nil;

@implementation NSObject (YLForwarding)

+ (void)load {
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
       _target = [YLForwardingTarget new];
       not_recognize_selector_classMethodSwizzle([self class], @selector(forwardingTargetForSelector:), @selector(yl_swizzleForwardingTargetForSelector:));
   });
}

+ (BOOL)isWhiteListClass:(Class)class {
   NSString *classString = NSStringFromClass(class);
   BOOL isInternal = [classString hasPrefix:@"_"];
   if (isInternal) {
       return NO;
   }
   BOOL isNull =  [classString isEqualToString:NSStringFromClass([NSNull class])];

   BOOL isMyClass  = [self isKindOfClass:class];
   return isNull || isMyClass;
}

- (id)yl_swizzleForwardingTargetForSelector:(SEL)aSelector {
   id result = [self yl_swizzleForwardingTargetForSelector:aSelector];
   if (result) {
       return result;
   }
   BOOL isWhiteListClass = [[self class] isWhiteListClass:[self class]];
   if (!isWhiteListClass) {
       return nil;
   }

   if (!result) {
       result = _target;
   }
   return result;
}

#pragma mark - private method
BOOL not_recognize_selector_classMethodSwizzle(Class aClass, SEL originalSelector, SEL swizzleSelector) {
   Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
   Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSelector);
   BOOL didAddMethod =
   class_addMethod(aClass,
                   originalSelector,
                   method_getImplementation(swizzleMethod),
                   method_getTypeEncoding(swizzleMethod));
   if (didAddMethod) {
       class_replaceMethod(aClass,
                           swizzleSelector,
                           method_getImplementation(originalMethod),
                           method_getTypeEncoding(originalMethod));
   } else {
       method_exchangeImplementations(originalMethod, swizzleMethod);
   }
   return YES;
}

@end
