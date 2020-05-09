//
//  UITableView+YLKit.h
//  YLKits
//
//  Created by Conner on 2019/4/22.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (YLKit)
/**
 *  为UITableViewCell添加分割线（默认是添加分区线为添加长线）
 *
 *  @param cell           cell
 *  @param indexPath      indexPath
 *  @param leftSpace      分割线左边离cell距离
 *  @param lineColor      线的颜色
 */
- (void)yl_addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace lineColor:(UIColor *)lineColor;

/**
 *  为UITableViewCell添加分割线（可选择是否添加分区线）
 *
 *  @param cell           cell
 *  @param indexPath      indexPath
 *  @param leftSpace      分割线左边离cell距离
 *  @param hasSectionLine section上面和下面是否有分割线
 *  @param lineColor      线的颜色
 */
- (void)yl_addLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace hasSectionLine:(BOOL)hasSectionLine lineColor:(UIColor *)lineColor;
/**
 *  为UITableViewCell添加分割线 （不考虑分区情况，直接添加短线）
 *
 *  @param cell           cell
 *  @param indexPath      indexPath
 *  @param leftSpace      分割线左边离cell距离
 *  @param lineColor      线的颜色
 */
- (void)yl_addShortLineforPlainCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath withLeftSpace:(CGFloat)leftSpace lineColor:(UIColor *)lineColor;

/// 分区添加圆角
/// @param cell 要添加的cell
/// @param indexPath 坐标
/// @param cornerRadius 圆角
/// @param leftRightMargin 左右间隙
/// @param topBottomMargin 上下间隙
- (void)yl_addSectionCornerRadiusWithCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath cornerRadius:(CGFloat)cornerRadius leftRightMargin:(CGFloat)leftRightMargin topBottomMargin:(CGFloat)topBottomMargin;
@end

NS_ASSUME_NONNULL_END
