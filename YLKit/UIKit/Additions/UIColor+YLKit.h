//
//  UIColor+YLKit.h
//  YLProject
//
//  Created by Conner on 2019/4/22.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YLKit)
/**
 *  Create an UIColor in format RGBA
 *
 *  @param r Red value
 *  @param g Green value
 *  @param b Blue value
 *  @param a Alpha value
 *
 *  @return Returns the created UIColor
 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

/**
 *  Create an UIColor in format RGB
 *
 *  @param r Red value
 *  @param g Green value
 *  @param b Blue value
 *
 *  @return Returns the created UIColor
 */
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

/**
 设置颜色
 @param hexString hexString
 @return 颜色
 */
+ (UIColor *)hexString:(NSString *)hexString;

/**
 设置颜色
 @param hex hex值
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor * _Nonnull)colorWithHex:(unsigned int)hex alpha:(float)alpha;

/**
 随机色
 @return 随机颜色值
 */
+ (UIColor *)randomColor;
@end

NS_ASSUME_NONNULL_END
