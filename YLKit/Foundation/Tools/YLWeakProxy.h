//
//  YLWeakProxy.h
//  YLKitsDemo
//
//  Created by Conner on 2019/11/29.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

#define YLProxyTarget(T) ([YLWeakProxy proxyWithTarget:T])

@interface YLWeakProxy : NSProxy

/// 初始化
/// @param target 要转发消息的对象
+ (instancetype)proxyWithTarget:(id)target;

/// 初始化
/// @param target 要转发消息的对象
- (instancetype)initWithTarget:(id)target;

@end


