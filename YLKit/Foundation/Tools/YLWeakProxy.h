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

+ (instancetype)proxyWithTarget:(id)target;

- (instancetype)initWithTarget:(id)target;

@end


