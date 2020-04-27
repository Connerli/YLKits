//
//  NSMutableArray+YLKit.m
//  YLKitsDemo
//
//  Created by Conner on 2020/4/23.
//  Copyright © 2020 Conner. All rights reserved.
//

#import "NSMutableArray+YLKit.h"

@implementation NSMutableArray (YLKit)

- (void)addSafeObject:(id)anObject {
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)insertSafeObject:(id)anObject atIndex:(NSUInteger)index {
    if (anObject) {
        [self insertObject:anObject atIndex:index];
    }
}

- (void)replaceSafeObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (anObject) {
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}
@end
