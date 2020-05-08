//
//  NSMutableArray+YLKit.h
//  YLKits
//
//  Created by Conner on 2020/4/23.
//  Copyright © 2020 Conner. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface NSMutableArray <ObjectType>(YLKit)

/// 安全添加元素防止为nil
/// @param anObject 添加的元素
- (void)addSafeObject:(ObjectType)anObject;

/// 安全插入元素防止为nil
/// @param anObject 添加的元素
/// @param index 位置
- (void)insertSafeObject:(ObjectType)anObject atIndex:(NSUInteger)index;

/// 安全替换元素
/// @param index 位置
/// @param anObject 替换为元素
- (void)replaceSafeObjectAtIndex:(NSUInteger)index withObject:(ObjectType)anObject;

@end


