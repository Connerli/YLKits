//
//  NSData+YLKit.h
//  YLKitsDemo
//
//  Created by Conner on 2019/11/28.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (YLKit)
/**
 *  Convert the given NSData to UTF8 NSString
 *
 *  @param data The NSData to be converted
 *
 *  @return Returns the converted NSData as UTF8 NSString
 */
+ (NSString * _Nonnull)convertToUTF8String:(NSData * _Nonnull)data;

/**
 *  Convert self to a UTF8 NSString
 *
 *  @return Returns self as UTF8 NSString
 */
- (NSString * _Nonnull)convertToUTF8String;

/**
 *  Convert the given NSData to ASCII NSString
 *
 *  @param data The NSData to be converted
 *
 *  @return Returns the converted NSData as ASCII NSString
 */
+ (NSString * _Nonnull)convertToASCIIString:(NSData * _Nonnull)data;

/**
 *  Convert self to a ASCII NSString
 *
 *  @return Returns self as ASCII NSString
 */
- (NSString * _Nonnull)convertToASCIIString;

/**
 *  Convert self UUID to NSString.
 *  Useful for push notifications
 *
 *  @return Returns self as NSString from UUID
 */
- (NSString * _Nullable)convertUUIDToString;

@end

