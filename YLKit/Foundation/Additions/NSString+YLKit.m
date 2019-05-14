//
//  NSString+YLKit.m
//  YLProject
//
//  Created by Conner on 2019/4/18.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import "NSString+YLKit.h"

@implementation NSString (YLKit)

+ (BOOL)isEmpty:(NSString *)string {
    if ((NSNull *)string == [NSNull null]) {
        return YES;
    }
    if (string == nil || [string length] == 0) {
        return YES;
    } else if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}


@end
