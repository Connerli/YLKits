//
//  NSArray+YLKit.h
//  YLProject
//
//  Created by Conner on 2019/4/22.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (YLKit)
/**
 类方法数组转换为json
 
 @param array 将要转换的数组
 @return jsonString
 */
+ (NSString * _Nonnull)arrayToJson:(NSArray * _Nonnull)array;

/**
 安全获取index 下的元素

 @param index 坐标
 @return 元素
 */
- (id _Nullable)safeObjectAtIndex:(NSUInteger)index;

/**
 逆序数组
 
 @return 排序后的数组
 */
- (NSArray * _Nonnull)reversedArray;

/**
 数组转换成jsonString

 @return jsonString
 */
- (NSString * _Nonnull)arrayToJson;

@end

NS_ASSUME_NONNULL_END
