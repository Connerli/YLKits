//
//  UIView+YLKit.h
//  YLKits
//
//  Created by Conner on 2019/4/22.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLKit)
//控制器
- (UIViewController*)yl_viewController;
//nib 文件
+ (UINib *)yl_viewWithNib;
@end

NS_ASSUME_NONNULL_END
