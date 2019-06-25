//
//  UIButton+YLKit.h
//  YLProject
//
//  Created by Conner on 2019/5/29.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YLButtonLayout){
    /** 正常位置，图左字右 */
    YLButtonLayoutNormal,
    /** 图右字左 */
    YLButtonLayoutImageRight,
    /** 图上字下 */
    YLButtonLayoutImageTop,
    /** 图下字上 */
    YLButtonLayoutImageBottom,
};

@interface UIButton (YLKit)
/**
 设置按钮文字图片位置
 
 @param status 类型
 @param margin 间隙
 */
- (void)layoutWithStatus:(YLButtonLayout)status andMargin:(CGFloat)margin;
@end

NS_ASSUME_NONNULL_END
