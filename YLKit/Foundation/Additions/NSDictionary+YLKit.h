//
//  NSDictionary+YLKit.h
//  YLProject
//
//  Created by Conner on 2019/9/3.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (YLKit)

/**
 字典转换为jsonString

 @param dictionary 要转换的字典
 @return jsonString
 */
+ (NSString * _Nonnull)dictionaryToJSON:(NSDictionary * _Nonnull)dictionary;


/**
 转换为JSONString

 @return 转换后的string
 */
- (NSString * _Nonnull)dictionaryToJSON;


/**
 安全获取某个key

 @param key 要获取的key
 @return key对应的value值
 */
- (id _Nullable)safeObjectForKey:(NSString * _Nonnull)key;

@end

NS_ASSUME_NONNULL_END
