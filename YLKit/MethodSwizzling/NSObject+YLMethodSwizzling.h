//
//  NSObject+YLMethodSwizzling.h
//  YLKitsDemo
//
//  Created by Conner on 2020/4/27.
//  Copyright © 2020 Conner. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YLMethodSwizzling)

/** 交换两个类方法的实现
 * @param originalSelector  原始方法的 SEL
 * @param swizzledSelector  交换方法的 SEL
 */
+ (void)yl_swizzlingClassMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;

/** 交换两个对象方法的实现
 * @param originalSelector  原始方法的 SEL
 * @param swizzledSelector 交换方法的 SEL
 */
+ (void)yl_swizzlingInstanceMethod:(SEL)originalSelector withMethod:(SEL)swizzledSelector;
@end

NS_ASSUME_NONNULL_END
