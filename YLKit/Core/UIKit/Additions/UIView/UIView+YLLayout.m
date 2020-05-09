//
//  UIView+YLLayout.m
//  YLKits
//
//  Created by Conner on 2019/5/31.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "UIView+YLLayout.h"

@implementation UIView (YLLayout)
- (CGFloat)yl_left {
    return self.frame.origin.x;
}

- (void)setYl_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)yl_top {
    return self.frame.origin.y;
}

- (void)setYl_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)yl_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYl_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)yl_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYl_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)yl_centerX {
    return self.center.x;
}

- (void)setYl_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


- (CGFloat)yl_centerY {
    return self.center.y;
}

- (void)setYl_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)yl_width {
    return self.frame.size.width;
}

- (void)setYl_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)yl_height {
    return self.frame.size.height;
}

- (void)setYl_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)yl_ttScreenX {
    CGFloat x = 0.0f;
    for (UIView* view = self; view; view = view.superview) {
        x += view.yl_left;
    }
    return x;
}

- (CGFloat)yl_ttScreenY {
    CGFloat y = 0.0f;
    for (UIView* view = self; view; view = view.superview) {
        y += view.yl_top;
    }
    return y;
}

- (CGFloat)yl_screenViewX {
    CGFloat x = 0.0f;
    for (UIView* view = self; view; view = view.superview) {
        x += view.yl_left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}

- (CGFloat)yl_screenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.yl_top;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

- (CGRect)yl_screenFrame {
    return CGRectMake(self.yl_screenViewX, self.yl_screenViewY, self.yl_width, self.yl_height);
}

- (CGPoint)yl_origin {
    return self.frame.origin;
}

- (void)setYl_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)yl_size {
    return self.frame.size;
}

- (void)setYl_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
