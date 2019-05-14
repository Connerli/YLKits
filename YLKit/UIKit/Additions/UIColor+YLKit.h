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
+ (UIColor * _Nonnull)hexString:(NSString * _Nonnull)hexString;

+ (UIColor*)colorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
