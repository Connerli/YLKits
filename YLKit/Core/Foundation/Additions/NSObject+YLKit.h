//
//  NSObject+YLKit.h
//  YLKits
//
//  Created by Conner on 2019/8/14.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (YLKit)
/**
 获取类名
 */
+ (NSString *)yl_className;

/**
 获取某个对象所有变量
 @param object 对象
 @return 变量数组
 */
+ (NSArray *)yl_getAllIvar:(id)object;

/**
 获取某个对象所有属性
 @param object 对象
 @return 属性数组
 */
+ (NSArray *)yl_getAllProperty:(id)object;


@end

NS_ASSUME_NONNULL_END
