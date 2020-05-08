//
//  YLAppInfo.m
//  YLKits
//
//  Created by Conner on 2019/10/31.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "YLAppInfo.h"
#import "NSString+YLKit.h"

static NSString *YLEverLaunched = @"YLEverLaunched";
static NSString *YLFirstLaunched = @"YLFirstLaunched";
static NSString *YLRecordAppVersion = @"YLRecordAppVersion";
static NSString *YLIsNewVerSion = @"YLIsNewVerSion";

#define YLUserDefaults [NSUserDefaults standardUserDefaults]

@implementation YLAppInfo
/// 启动时候配置是否是首次启动
/// @param block 是否是首次启动
+ (void)onFinishLaunchForFirstLaunch:(void(^)(BOOL isFirstLaunch))block {
    if (![YLUserDefaults valueForKey:YLEverLaunched]) {
        [YLUserDefaults setBool:YES forKey:YLEverLaunched];
        [YLUserDefaults setBool:YES forKey:YLFirstLaunched];
    } else {
        [YLUserDefaults setBool:NO forKey:YLFirstLaunched];
    }
    [YLUserDefaults synchronize];
    if (block) {
        block([self isFirstLaunch]);
    }
}

/// 是否是第一次启动 tips:依赖于上面方法已经调用过
+ (BOOL)isFirstLaunch {
    return [YLUserDefaults boolForKey:YLFirstLaunched];
}

/// 启动时候配置当前版本是否是新版本
/// @param block 是否是新版本
+ (void)onFinishLaunchForCurrentVersion:(void(^)(BOOL isNewVersion))block {
    NSString *recordVersion = [YLUserDefaults objectForKey:YLRecordAppVersion];
    if ([NSString isEmpty:recordVersion] || ![recordVersion isEqualToString:APP_VERSION]) {
        [YLUserDefaults setObject:APP_VERSION forKey:YLRecordAppVersion];
        [YLUserDefaults setBool:YES forKey:YLIsNewVerSion];
    } else {
        [YLUserDefaults setBool:NO forKey:YLIsNewVerSion];
    }
    [YLUserDefaults synchronize];
    if (block) {
        block([self isNewVersion]);
    }
}

/// 是否是新版本 tips:依赖于上面方法已经调用过
+ (BOOL)isNewVersion {
    return [YLUserDefaults boolForKey:YLIsNewVerSion];
}


@end
