//
//  YLAppInfo.h
//  YLKits
//
//  Created by Conner on 2019/10/31.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Get App name
 */
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

/**
 *  Get App build
 */
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/**
 *  Get App version
 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

@interface YLAppInfo : NSObject

/// 启动时候配置是否是首次启动
/// @param block 是否是首次启动
+ (void)onFinishLaunchForFirstLaunch:(void(^)(BOOL isFirstLaunch))block;

/// 是否是第一次启动 tips:依赖于上面方法已经调用过
+ (BOOL)isFirstLaunch;

/// 启动时候配置当前版本是否是新版本
/// @param block 是否是新版本
+ (void)onFinishLaunchForCurrentVersion:(void(^)(BOOL isNewVersion))block;

/// 是否是新版本 tips:依赖于上面方法已经调用过
+ (BOOL)isNewVersion;


@end

