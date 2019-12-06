//
//  YLTimeUtils.m
//  YLKitsDemo
//
//  Created by Conner on 2019/11/29.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "YLTimeUtils.h"
#import <sys/sysctl.h>

#define DATE_COMPONENTS (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)

#define CURRENT_CALENDAR [NSCalendar currentCalendar]

@interface YLTimeUtils ()

@property(nonatomic,strong)NSDateFormatter *dateFormatter;

@end


@implementation YLTimeUtils
+ (YLTimeUtils *)sharedInstance {
    static YLTimeUtils *singleton = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        singleton = [[YLTimeUtils alloc] init];
        singleton.dateFormatter = [[NSDateFormatter alloc] init];
    });
    return singleton;
}

#pragma mark - 时间处理
/**
 *  获取系统时间(毫秒)
 *
 */
+ (NSString *)getSystemTimeString {
    return [NSString stringWithFormat:@"%@", @([self getSystemTimeInterval])];
}
/**
 * 获取系统时间(NSDate)
 */
+ (NSDate *)getSystemTimeDate {
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:([self getSystemTimeInterval]) / 1000];
    return date;
}
/**
 *  返回毫秒为单位的时间
 *
 *  @return long long
 */
+ (long long)getSystemTimeInterval {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long long realLocalTime = 0;
    long long serverTime = [defaults doubleForKey:@"serverTime"];
    long long lastSyncLocalRunTime = [defaults doubleForKey:@"lastSyncLocalRunTime"];
    long long curLocalRunTiem = [self systemUptimeSinceLastBoot] * 1000;
    if (serverTime != 0 && lastSyncLocalRunTime != 0) {
        realLocalTime = serverTime + (curLocalRunTiem - lastSyncLocalRunTime);
    } else {
        realLocalTime = [[NSDate date] timeIntervalSince1970]*1000;
    }
    return realLocalTime;
}

+ (void)syncServerTimeAndSystemRuntimeWith:(NSDate *)serverTime {
    if (serverTime != nil) {
        long long serverTimeLong = [[NSNumber numberWithDouble:[serverTime timeIntervalSince1970]] longLongValue] * 1000;
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setDouble:serverTimeLong forKey:@"serverTime"];
        [ud setDouble:[self systemUptimeSinceLastBoot] * 1000 forKey:@"lastSyncLocalRunTime"];
        [ud synchronize];
    }
}

//计算启动时差
+ (NSTimeInterval)systemUptimeSinceLastBoot {
    struct timeval now;
    struct timezone tz;
    gettimeofday(&now, &tz);
    
    struct timeval boottime;
    int mib[2] = {CTL_KERN, KERN_BOOTTIME};
    size_t size = sizeof(boottime);
    
    double uptime = -1;
    
    if (sysctl(mib, 2, &boottime, &size, NULL, 0) != -1 && boottime.tv_sec != 0) {
        uptime = now.tv_sec - boottime.tv_sec;
        uptime += (double)(now.tv_usec - boottime.tv_usec) / 1000000.0;
    }
    return uptime;
}

/**
 *  获取系统时间,按照指定格式
 *
 *  @param format 格式字符串
 *
 *  @return 指定格式时间字符串
 */
+ (NSString *)getSystemTimeStringWithFormat:(YLSecondToDateFormat)format {
    long long systemTime = [self getSystemTimeInterval];
    return [self timeStringWithInterval:systemTime format:format];
}

/**
 *  时间戳转日期
 *
 *  @param timeInterval 时间(毫秒)
 *  @param formatString 格式字符串
 *
 *  @return 指定格式时间字符串
 */
+ (NSString *)timeStringWithInterval:(long long)timeInterval stringFormat:(NSString *)formatString {
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timeInterval / 1000];
    NSDateFormatter *dateFormat = [self sharedInstance].dateFormatter;
    dateFormat.dateFormat = formatString;
    return [dateFormat stringFromDate:date];
}

/**
 *  时间戳转日期
 *
 *  @param timeInterval 时间(毫秒)
 *  @param format       时间格式枚举值
 *
 *  @return 指定格式时间字符串
 */
+ (NSString *)timeStringWithInterval:(long long)timeInterval format:(YLSecondToDateFormat)format {
    
    NSDictionary *dataFormatDic = @{@(YLDateFormat_yyyy):@"yyyy",
                                    @(YLDateFormat_MM):@"MM",
                                    @(YLDateFormat_dd):@"dd",
                                    @(YLDateFormat_hh):@"hh",
                                    @(YLDateFormat_HH):@"HH",
                                    @(YLDateFormat_mm):@"mm",
                                    @(YLDateFormat_MM_dd):@"MM-dd",
                                    @(YLDateFormat_yy_MM_dd):@"yy-MM-dd",
                                    @(YLDateFormat_yyyy_MM_dd):@"yyyy-MM-dd",
                                    @(YLDateFormat_yyyy_s_MM_s_dd):@"yyyy/MM/dd",
                                    @(YLDateFormat_HH_mm):@"HH:mm",
                                    @(YLDateFormat_yyyy_MM_dd_HH_mm):@"yyyy-MM-dd HH:mm",
                                    @(YLDateFormat_yyyy_s_MM_s_dd_HH_mm):@"yyyy/MM/dd HH:mm",
                                    @(YLDateFormat_EEE):@"EEE",
                                    @(YLDateFormat_yyyy_MM_dd_HH_mm_ss):@"yyyy-MM-dd HH:mm:ss"};
    
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timeInterval / 1000];
    NSDateFormatter *dateFormat = [self sharedInstance].dateFormatter;
    dateFormat.dateFormat = dataFormatDic[@(format)];
    return [dateFormat stringFromDate:date];
}
/**
 *  时间date转日期
 *
 *  @param date     日期
 *  @param format   时间格式枚举值
 *
 *  @return 指定格式时间字符串
 */
+ (NSString *)timeStringWithDate:(NSDate *)date format:(YLSecondToDateFormat)format {
    NSDictionary *dataFormatDic = @{@(YLDateFormat_yyyy):@"yyyy",
                                    @(YLDateFormat_MM):@"MM",
                                    @(YLDateFormat_dd):@"dd",
                                    @(YLDateFormat_hh):@"hh",
                                    @(YLDateFormat_HH):@"HH",
                                    @(YLDateFormat_mm):@"mm",
                                    @(YLDateFormat_MM_dd):@"MM-dd",
                                    @(YLDateFormat_yy_MM_dd):@"yy-MM-dd",
                                    @(YLDateFormat_yyyy_MM_dd):@"yyyy-MM-dd",
                                    @(YLDateFormat_yyyy_s_MM_s_dd):@"yyyy/MM/dd",
                                    @(YLDateFormat_HH_mm):@"HH:mm",
                                    @(YLDateFormat_yyyy_MM_dd_HH_mm):@"yyyy-MM-dd HH:mm",
                                    @(YLDateFormat_yyyy_s_MM_s_dd_HH_mm):@"yyyy/MM/dd HH:mm",
                                    @(YLDateFormat_EEE):@"EEE",
                                    @(YLDateFormat_yyyy_MM_dd_HH_mm_ss):@"yyyy-MM-dd HH:mm:ss"};
    NSDateFormatter *dateFormat = [self sharedInstance].dateFormatter;
    dateFormat.dateFormat = dataFormatDic[@(format)];
    return [dateFormat stringFromDate:date];
}
/**
 *  时间string转date
 *
 *  @param timeString 时间字符串
 *  @param format   时间格式枚举值
 *
 *  @return 指定格式时间字符串
 */
+ (NSDate *)timeDateWithString:(NSString *)timeString format:(YLSecondToDateFormat)format {
    NSDictionary *dataFormatDic = @{@(YLDateFormat_yyyy):@"yyyy",
                                    @(YLDateFormat_MM):@"MM",
                                    @(YLDateFormat_dd):@"dd",
                                    @(YLDateFormat_hh):@"hh",
                                    @(YLDateFormat_HH):@"HH",
                                    @(YLDateFormat_mm):@"mm",
                                    @(YLDateFormat_MM_dd):@"MM-dd",
                                    @(YLDateFormat_yy_MM_dd):@"yy-MM-dd",
                                    @(YLDateFormat_yyyy_MM_dd):@"yyyy-MM-dd",
                                    @(YLDateFormat_yyyy_s_MM_s_dd):@"yyyy/MM/dd",
                                    @(YLDateFormat_HH_mm):@"HH:mm",
                                    @(YLDateFormat_yyyy_MM_dd_HH_mm):@"yyyy-MM-dd HH:mm",
                                    @(YLDateFormat_yyyy_s_MM_s_dd_HH_mm):@"yyyy/MM/dd HH:mm",
                                    @(YLDateFormat_EEE):@"EEE",
                                    @(YLDateFormat_yyyy_MM_dd_HH_mm_ss):@"yyyy-MM-dd HH:mm:ss"};
    NSDateFormatter *dateFormat = [self sharedInstance].dateFormatter;
    dateFormat.dateFormat = dataFormatDic[@(format)];
    return [dateFormat dateFromString:timeString];
}

/**
 *  英式星期 转换为 中文式星期
 *
 *  @param week 英式星期
 *
 *  @return 中文式星期
 */
+ (NSString *)weekFomtEnglishToChinese:(NSString *)week{
    NSDictionary *weekDic = @{@"Sun":@"周日",@"Mon":@"周一",@"Tue":@"周二",@"Wed":@"周三",@"Thu":@"周四",@"Fri":@"周五",@"Sat":@"周六"};
    
    return [weekDic[week] stringValue];
}

/**
 *  秒转成气泡显示格式字符串
 *
 *  @param timeInterval 时长
 *
 *  @return 指定格式字符串
 */
+ (NSString *)secondToBubbleFormat:(long long)timeInterval {
    NSString *result;
    
    if (timeInterval == 60) {
        return @"60''";
    }
    
    NSInteger min = timeInterval / 60;
    NSInteger sec = timeInterval % 60;
    if (min > 0) {
        result = [NSString stringWithFormat:@"%@'%@''", @(min), @(sec)];
    } else {
        result = [NSString stringWithFormat:@"%@''", @(sec)];
    }
    
    return result;
}

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
+ (NSString *)intervalSinceNow:(long long)timeInterval {
    //相差多少秒
    NSTimeInterval secondsDiff = ([self getSystemTimeInterval] - timeInterval) / 1000 ;
    
    NSString *timeString;
    
    if (secondsDiff / 3600 < 1) {
        if (secondsDiff / 60 < 1) {
            timeString = @"刚刚";
        } else {
            timeString = [NSString stringWithFormat:@"%d分钟前", (int)secondsDiff / 60];
        }
    } else if (secondsDiff / 3600 > 1 && secondsDiff / 86400 < 1) {
        timeString = [NSString stringWithFormat:@"%d小时前", (int)secondsDiff / 3600];
    } else if (secondsDiff / 86400 > 1 && secondsDiff / 604800 < 1) {
        timeString = [NSString stringWithFormat:@"%d天前", (int)secondsDiff / 86400];
    } else {
        timeString = [self timeStringWithInterval:timeInterval stringFormat:@"yyyy-MM-dd HH:mm"];
    }
    return timeString;
}

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
+ (NSString *)timeIntervalSinceNow:(long long)timeInterval {
    //相差多少秒
    NSTimeInterval secondsDiff = ([self getSystemTimeInterval] - timeInterval) / 1000 ;
    
    NSString *timeString;
    
    if (secondsDiff / 3600 < 1) {
        if (secondsDiff / 60 < 1) {
            timeString = @"刚刚";
        } else {
            timeString = [NSString stringWithFormat:@"%d分钟前", (int)secondsDiff / 60];
        }
    } else if (secondsDiff / 3600 > 1 && secondsDiff / 86400 < 1) {
        timeString = [NSString stringWithFormat:@"%d小时前", (int)secondsDiff / 3600];
    } else if (secondsDiff / 86400 > 1 && secondsDiff / 604800 < 1) {
        timeString = [NSString stringWithFormat:@"%d天前", (int)secondsDiff / 86400];
    } else {
        timeString = [self timeStringWithInterval:timeInterval stringFormat:@"yyyy-MM-dd"];
    }
    return timeString;
}

/**
 *  获取当前日期几天后的日期
 *
 *  @param days 天数
 */
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days{
    NSDate *currentDate = [self getSystemTimeDate];;
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.day = days;
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:currentDate options:0];
    return date;
}
/**
 *  获取当前日期几天后的日期字符串
 *
 *  @param days  天数
 *  @param format 日期格式
 */
+ (NSString *)dateStringWithDaysFromNow: (NSInteger)days format:(YLSecondToDateFormat)format{
    
    NSDictionary *dataFormatDic = @{@(YLDateFormat_yyyy):@"yyyy",
                                    @(YLDateFormat_MM):@"MM",
                                    @(YLDateFormat_dd):@"dd",
                                    @(YLDateFormat_hh):@"hh",
                                    @(YLDateFormat_HH):@"HH",
                                    @(YLDateFormat_mm):@"mm",
                                    @(YLDateFormat_MM_dd):@"MM-dd",
                                    @(YLDateFormat_yy_MM_dd):@"yy-MM-dd",
                                    @(YLDateFormat_yyyy_MM_dd):@"yyyy-MM-dd",
                                    @(YLDateFormat_yyyy_s_MM_s_dd):@"yyyy/MM/dd",
                                    @(YLDateFormat_HH_mm):@"HH:mm",
                                    @(YLDateFormat_yyyy_MM_dd_HH_mm):@"yyyy-MM-dd HH:mm",
                                    @(YLDateFormat_yyyy_s_MM_s_dd_HH_mm):@"yyyy/MM/dd HH:mm",
                                    @(YLDateFormat_EEE):@"EEE",
                                    @(YLDateFormat_yyyy_MM_dd_HH_mm_ss):@"yyyy-MM-dd HH:mm:ss"};
    NSDate *date = [self dateWithDaysFromNow:days];
    NSDateFormatter *dateFormat = [self sharedInstance].dateFormatter;
    dateFormat.dateFormat = dataFormatDic[@(format)];
    return [dateFormat stringFromDate:date];
}

+ (BOOL) isEarlierThanDate: (NSDate *) aDate{
    return ([[NSDate date] compare:aDate] == NSOrderedAscending);
}
+ (NSString *)weekStringWithSystemTime {
    return [self weekStringWithDate:[self getSystemTimeDate]];
}
/**
 *  根据日期获取该日期是星期几
 */
+ (NSString *)weekStringWithDate:(NSDate *)date{
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
    NSInteger weekday = components.weekday;
    NSArray *weekdays = @[@"",@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    if (weekdays.count > weekday) {
        return weekdays[weekday];
    }
    return @"";
}
+ (NSString *)timeBucketWithSystemTime {
    return [self timeBucketWith:[self getSystemTimeDate]];
}
+ (NSString *)timeBucketWith:(NSDate *)date {
    NSDateComponents *components = [CURRENT_CALENDAR components:DATE_COMPONENTS fromDate:date];
    NSInteger hour = components.hour;
    if (hour >= 6 && hour < 8) {
        return @"早上";
    } else if (hour >= 8 && hour < 11) {
        return @"上午";
    } else if (hour >= 11 && hour < 13) {
        return @"中午";
    } else if (hour >= 13 && hour < 17) {
        return @"下午";
    } else if ((hour >= 17 && hour < 24) || (hour >= 0 && hour < 6)){
        return @"晚上";
    }
    return @"";
}

+(NSDate *)getFirstDayOfThisWeek:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    NSInteger weekday = [dateComponents weekday];   //第几天(从sunday开始)
    NSInteger firstDiff,lastDiff;
    if (weekday == 1) {
        firstDiff = -6;
        lastDiff = 0;
    }else {
        firstDiff =  - weekday + 2;
        lastDiff = 8 - weekday;
    }
    NSInteger day = [dateComponents day];
    NSDateComponents *firstComponents = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    [firstComponents setDay:day+firstDiff];
    NSDate *firstDay = [calendar dateFromComponents:firstComponents];
    return firstDay;
}
+ (NSDate *)getLastDayOfThisWeek:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    NSInteger weekday = [dateComponents weekday];   //第几天(从sunday开始)
    NSInteger firstDiff,lastDiff;
    if (weekday == 1) {
        firstDiff = -6;
        lastDiff = 0;
    }else {
        firstDiff =  - weekday + 2;
        lastDiff = 8 - weekday;
    }
    NSInteger day = [dateComponents day];
    NSDateComponents *lastComponents = [calendar components:NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date];
    [lastComponents setDay:day+lastDiff];
    NSDate *lastDay = [calendar dateFromComponents:lastComponents];
    return lastDay;
}

+ (NSDate *)getFirstDayOfThisMonth:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&firstDay interval:nil forDate:date];
    return firstDay;
}

+ (NSDate *)getLastDayOfThisMonth:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSCalendarUnitMonth startDate:&firstDay interval:nil forDate:date];
    NSDateComponents *lastDateComponents = [calendar components:NSCalendarUnitMonth | NSCalendarUnitYear |NSCalendarUnitDay fromDate:firstDay];
    NSUInteger dayNumberOfMonth = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    NSInteger day = [lastDateComponents day];
    [lastDateComponents setDay:day+dayNumberOfMonth-1];
    NSDate *lastDay = [calendar dateFromComponents:lastDateComponents];
    return lastDay;
}

+(NSDate *)getFirstDayOfThisYear:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSCalendarUnitYear startDate:&firstDay interval:nil forDate:date];
    return firstDay;
}

+(NSDate *)getLastDayOfThisYear:(NSDate *)date
{
    //通过2月天数的改变，来确定全年天数
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"yyyy"];
    NSString *dateStr = [formatter stringFromDate:date];
    dateStr = [dateStr stringByAppendingString:@"-02-14"];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *aDayOfFebruary = [formatter dateFromString:dateStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *firstDay;
    [calendar rangeOfUnit:NSCalendarUnitYear startDate:&firstDay interval:nil forDate:date];
    NSDateComponents *lastDateComponents = [calendar components:NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitDay fromDate:firstDay];
    NSUInteger dayNumberOfFebruary = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:aDayOfFebruary].length;
    NSInteger day = [lastDateComponents day];
    [lastDateComponents setDay:day+337+dayNumberOfFebruary-1];
    NSDate *lastDay = [calendar dateFromComponents:lastDateComponents];
    return lastDay;
}
@end
