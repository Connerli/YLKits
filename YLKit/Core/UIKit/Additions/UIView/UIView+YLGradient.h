//
//  UIView+YLGradient.h
//  YLKits
//
//  Created by Conner on 2019/5/31.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLGradient)
//tips:设置了渐变色 背景色设置就失效了，要设置背景色就把colos 置为nil

@property(nullable, copy) NSArray *yl_colors;
@property(nullable, copy) NSArray<NSNumber *> *yl_locations;
@property CGPoint yl_startPoint;
@property CGPoint yl_endPoint;

+ (UIView *_Nullable)yl_gradientViewWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

- (void)yl_setGradientBackgroundWithColors:(NSArray<UIColor *> *_Nullable)colors locations:(NSArray<NSNumber *> *_Nullable)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
@end

NS_ASSUME_NONNULL_END
