//
//  NSArray+YLKit.m
//  YLKits
//
//  Created by Conner on 2019/4/22.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import "NSArray+YLKit.h"

@implementation NSArray (YLKit)

- (id _Nullable)yl_safeObjectAtIndex:(NSUInteger)index {
    if ([self count] > 0 && [self count] > index) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}

- (NSArray *)yl_reversedArray {
    return [NSArray reversedArray:self];
}

+ (NSArray * _Nonnull)reversedArray:(NSArray * _Nonnull)array {
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[array count]];
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    
    for (id element in enumerator) [arrayTemp addObject:element];
    
    return arrayTemp;
}

- (NSString * _Nonnull)yl_arrayToJson {
    return [NSArray yl_arrayToJson:self];
}

+ (NSString * _Nonnull)yl_arrayToJson:(NSArray * _Nonnull)array {
    NSString *json = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
    if (!error) {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return json;
    } else {
        return error.localizedDescription;
    }
}

@end
