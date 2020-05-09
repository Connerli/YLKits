//
//  UIView+YLGradient.m
//  YLKits
//
//  Created by Conner on 2019/5/31.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "UIView+YLGradient.h"
#import <objc/runtime.h>

@implementation UIView (YLGradient)
+ (Class)layerClass {
    return [CAGradientLayer class];
}

+ (UIView *)yl_gradientViewWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIView *view = [[self alloc] init];
    [view yl_setGradientBackgroundWithColors:colors locations:locations startPoint:startPoint endPoint:endPoint];
    return view;
}

- (void)yl_setGradientBackgroundWithColors:(NSArray<UIColor *> *)colors locations:(NSArray<NSNumber *> *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    NSMutableArray *colorsM = [NSMutableArray array];
    for (UIColor *color in colors) {
        [colorsM addObject:(__bridge id)color.CGColor];
    }
    self.yl_colors = [colorsM copy];
    self.yl_locations = locations;
    self.yl_startPoint = startPoint;
    self.yl_endPoint = endPoint;
}

#pragma mark- Getter&Setter

- (NSArray *)yl_colors {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setYl_colors:(NSArray *)colors {
    objc_setAssociatedObject(self, @selector(yl_colors), colors, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setColors:self.yl_colors];
    }
}

- (NSArray<NSNumber *> *)yl_locations {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setYl_locations:(NSArray<NSNumber *> *)locations {
    objc_setAssociatedObject(self, @selector(yl_locations), locations, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setLocations:self.yl_locations];
    }
}

- (CGPoint)yl_startPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setYl_startPoint:(CGPoint)startPoint {
    objc_setAssociatedObject(self, @selector(yl_startPoint), [NSValue valueWithCGPoint:startPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setStartPoint:self.yl_startPoint];
    }
}

- (CGPoint)yl_endPoint {
    return [objc_getAssociatedObject(self, _cmd) CGPointValue];
}

- (void)setYl_endPoint:(CGPoint)endPoint {
    objc_setAssociatedObject(self, @selector(yl_endPoint), [NSValue valueWithCGPoint:endPoint], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self.layer isKindOfClass:[CAGradientLayer class]]) {
        [((CAGradientLayer *)self.layer) setEndPoint:self.yl_endPoint];
    }
}
@end

@implementation UILabel (YLGradient)

+ (Class)layerClass {
    return [CAGradientLayer class];
}

@end
