//
//  CALayer+YLKit.m
//  YLProject
//
//  Created by Conner on 2019/4/18.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import "CALayer+YLKit.h"

@implementation CALayer (YLKit)
- (void)setBorderUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

- (UIColor *)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
