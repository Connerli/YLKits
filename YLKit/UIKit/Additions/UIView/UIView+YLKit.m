//
//  UIView+YLKit.m
//  YLProject
//
//  Created by Conner on 2019/4/22.
//  Copyright © 2019年 Conner. All rights reserved.
//

#import "UIView+YLKit.h"

@implementation UIView (YLKit)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

+ (NSString *)viewClassName {
    return NSStringFromClass([self class]);
}

+ (UINib *)viewWithNib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
