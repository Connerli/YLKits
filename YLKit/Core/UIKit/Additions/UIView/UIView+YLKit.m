//
//  UIView+YLKit.m
//  YLKits
//
//  Created by Conner on 2019/4/22.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import "UIView+YLKit.h"

@implementation UIView (YLKit)

- (UIViewController*)yl_viewController {
    UIResponder * next = self;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    }
    return nil;
}

+ (UINib *)yl_viewWithNib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
