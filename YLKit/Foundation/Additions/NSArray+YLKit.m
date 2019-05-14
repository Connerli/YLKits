//
//  NSArray+YLKit.m
//  YLProject
//
//  Created by Conner on 2019/4/22.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import "NSArray+YLKit.h"

@implementation NSArray (YLKit)
- (id _Nullable)safeObjectAtIndex:(NSUInteger)index {
    if ([self count] > 0 && [self count] > index) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}
@end
