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
- (void)setBorderUIColor:(UIColor *)color;
- (UIColor *)borderUIColor;
@end

NS_ASSUME_NONNULL_END
