//
//  NSData+YLKit.m
//  YLKits
//
//  Created by Conner on 2019/11/28.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "NSData+YLKit.h"

@implementation NSData (YLKit)

+ (NSString * _Nonnull)yl_convertToUTF8String:(NSData * _Nonnull)data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString * _Nonnull)yl_convertToUTF8String {
    return [NSData yl_convertToUTF8String:self];
}

+ (NSString * _Nonnull)yl_convertToASCIIString:(NSData * _Nonnull)data {
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}

- (NSString * _Nonnull)yl_convertToASCIIString {
    return [NSData yl_convertToASCIIString:self];
}

- (NSString * _Nullable)yl_convertUUIDToString {
    return [[[self description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]] stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
