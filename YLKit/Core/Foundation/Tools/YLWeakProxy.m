//
//  YLWeakProxy.m
//  YLKits
//
//  Created by Conner on 2019/11/29.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "YLWeakProxy.h"

@interface YLWeakProxy ()

@property (weak,nonatomic,readonly) id target;

@end

@implementation YLWeakProxy

- (instancetype)initWithTarget:(id)target{
    _target = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target{
    return [[self alloc] initWithTarget:target];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [self.target methodSignatureForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [self.target respondsToSelector:aSelector];
}
@end
