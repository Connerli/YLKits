//
//  CALayer+YLKit.h
//  YLProject
//
//  Created by Conner on 2019/4/18.
//  Copyright © 2019年 Conner. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (YLKit)
/**
 设置border颜色 主要用于xib方便设置色值
 @param color 色值
 */
- (void)setBorderUIColor:(UIColor *)color;

/**
 border的UI 色值
 @return 色值
 */
- (UIColor *)borderUIColor;
@end

NS_ASSUME_NONNULL_END
