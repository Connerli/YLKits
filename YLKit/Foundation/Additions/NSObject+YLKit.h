//
//  NSObject+YLKit.h
//  YLProject
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
+ (NSString *)className;

/**
 获取某个对象所有变量
 @param object 对象
 @return 变量数组
 */
+ (NSArray *)getAllIvar:(id)object;

/**
 获取某个对象所有属性
 @param object 对象
 @return 属性数组
 */
+ (NSArray *)getAllProperty:(id)object;
@end

NS_ASSUME_NONNULL_END
