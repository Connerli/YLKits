//
//  YLTimeUtils.h
//  YLKitsDemo
//
//  Created by Conner on 2019/11/29.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SecondToDateFormat) {
    //例：2017年7月9日 17:30
    /**
     *  年：2017
     */
    Second_To_Date_Format_yyyy = 0,
    /**
     *  月：07
     */
    Second_To_Date_Format_MM,
    /**
     *  日：09
     */
    Second_To_Date_Format_dd,
    /**
     *  时：05
     */
    Second_To_Date_Format_hh,
    /**
     *  时：17
     */
    Second_To_Date_Format_HH,
    /**
     *  分：30
     */
    Second_To_Date_Format_mm,
    /**
     *  时分：17：30
     */
    Second_To_Date_Format_HH_mm,
    /**
     *   日期：07-09
     */
    Second_To_Date_Format_MM_dd,
    /**
     *  日期：15-07-09
     */
    Second_To_Date_Format_yy_MM_dd,
    /**
     *  日期：2017-07-09
     */
    Second_To_Date_Format_yyyy_MM_dd,
    /**
     *  日期：2017/07/09
     */
    Second_To_Date_Format_yyyy_s_MM_s_dd,
    /**
     *  日期时间：2017-07-09 17:30
     */
    Second_To_Date_Format_yyyy_MM_dd_HH_mm,
    /**
     *  日期时间：2017/07/09 17:30
     */
    Second_To_Date_Format_yyyy_s_MM_s_dd_HH_mm,
    /**
     *  星期日：sun
     */
    Second_To_Date_Format_EEE,
    /**
     *  日期时间： 2017-01-01 11：11：11
     */
    Second_To_Date_Format_yyyy_MM_dd_HH_mm_ss
};

@interface YLTimeUtils : NSObject

+ (YLTimeUtils *)sharedInstance;

#pragma mark - 时间处理
/**
 同步服务器时间和系统运行时间
 
 @param serverTime 服务器时间
 */
+ (void)syncServerTimeAndSystemRuntimeWith:(NSDate *)serverTime;

/**
 获取系统时间 字符串形式
 @return 系统时间
 */
+ (NSString *)getSystemTimeString;
/**
 获取系统时间 long long
 @return 系统时间
 */
+ (long long)getSystemTimeInterval;
/**
 获取系统时间 NSDate
 @return 系统时间
 */
+ (NSDate *)getSystemTimeDate;
/**
 *  获取系统时间,按照指定格式
 *
 *  @param format 格式字符串
 *
 *  @return 指定格式时间字符串
 */
+ (NSString *)getSystemTimeStringWithFormat:(SecondToDateFormat)format;

/**
 *  时间戳转日期
 *
 *  @param timeInterval 时间(毫秒)
 *  @param formatString 格式字符串
 *
 *  @return 指定格式时间字符串
 */
+ (NSString *)timeStringWithInterval:(long long)timeInterval stringFormat:(NSString *)formatString;

/**
 *  时间戳转日期
 *
 *  @param timeInterval 时间(毫秒)
 *  @param format       时间格式枚举值
 *
 *  @return 指定格式时间字符串
 */
+ (NSString *)timeStringWithInterval:(long long)timeInterval format:(SecondToDateFormat)format;
/**
 *  时间date转日期
 *
 *  @param date     时间date
 *  @param format   时间格式枚举值
 *
 *  @return 指定格式时间字符串
 */
+ (NSString *)timeStringWithDate:(NSDate *)date format:(SecondToDateFormat)format;
/**
 *  时间string转date
 *
 *  @param timeString 时间字符串
 *  @param format   时间格式枚举值
 *
 *  @return 指定格式时间字符串
 */
+ (NSDate *)timeDateWithString:(NSString *)timeString format:(SecondToDateFormat)format;
/**
 *  英式星期 转换为 中文式星期
 *
 *  @param week 英式
 *
 *  @return 中文式星期
 */
+ (NSString *)weekFomtEnglishToChinese:(NSString *)week;

/**
 *  秒转成气泡显示格式字符串
 *
 *  @param timeInterval 时长
 *
 *  @return 指定格式字符串
 */
+ (NSString *)secondToBubbleFormat:(long long)timeInterval;

/**
 *  友好时间显示
 *
 *  @param timeInterval 时间戳
 *
 *  1.小于一分钟：刚刚
 *  2.小于一小时：x分钟前
 *  3.超过一小时，小于24小时：x小时前
 *  4.超过1天，小于7天：x天前
 *  5.其余显示：yyyy-MM-dd HH:mm
 *
 *  @return 指定格式字符串
 */
+ (NSString *)intervalSinceNow:(long long)timeInterval;

/**
 *  友好时间显示
 *
 *  @param timeInterval 时间戳
 *
 *  1.小于一分钟：刚刚
 *  2.小于一小时：x分钟前
 *  3.超过一小时，小于24小时：x小时前
 *  4.超过1天，小于7天：x天前
 *  5.其余显示：yyyy-MM-dd
 *
 *  @return 指定格式字符串
 */
+ (NSString *)timeIntervalSinceNow:(long long)timeInterval;
/**
 *  获取当前日期几天后的日期
 *
 *  @param days 天数
 */
+ (NSDate *)dateWithDaysFromNow:(NSInteger) days;
/**
 *  获取当前日期几天后的日期字符串
 *
 *  @param days  天数
 *  @param format 日期格式
 */
+ (NSString *)dateStringWithDaysFromNow:(NSInteger)days format:(SecondToDateFormat)format;
/**
 *  比较某一个日期是否比现在的日期早
 *
 *  @param aDate 需要比较的日期
 */
+ (BOOL)isEarlierThanDate:(NSDate *) aDate;
/**
 当前时间是周几

 @return 周几
 */
+ (NSString *)weekStringWithSystemTime;
/**
 *  根据日期获取改日期是星期几
 */
+ (NSString *)weekStringWithDate:(NSDate *)date;
/**
 系统时间所处的时间段
 @return  时间段 早上 上午 中午 下午 晚上
 */
+ (NSString *)timeBucketWithSystemTime;
/**
 根据date当前处于时间段
 @param date 时间
 @return 时间段 早上 上午 中午 下午 晚上
 */
+ (NSString *)timeBucketWith:(NSDate *)date;
/**
 *  得到这个周的第一天和最后一天
 */
+(NSDate *)getFirstDayOfThisWeek:(NSDate *)date;
+(NSDate *)getLastDayOfThisWeek:(NSDate *)date;
/**
 *  得到这个月的第一天和最后一天
 */
+(NSDate *)getFirstDayOfThisMonth:(NSDate *)date;
+(NSDate *)getLastDayOfThisMonth:(NSDate *)date;
/**
 *  得到今年的第一天和最后一天
 */
+(NSDate *)getFirstDayOfThisYear:(NSDate *)date;
+(NSDate *)getLastDayOfThisYear:(NSDate *)date;

@end

