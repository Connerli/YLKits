//
//  CALayer+YLKit.m
//  YLKits
//
//  Created by Conner on 2019/4/18.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import "CALayer+YLKit.h"

@implementation CALayer (YLKit)
- (void)yl_setBorderUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

- (UIColor *)yl_borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
