//
//  UILabel+YLKit.m
//  YLKitsDemo
//
//  Created by Conner on 2019/10/19.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "UILabel+YLKit.h"
#import <objc/runtime.h>

@implementation UILabel (YLKit)
static char kContentInsetsKey;
static char kshowContentInsetsKey;

- (void)setContentInsets:(UIEdgeInsets)contentInsets {
    objc_setAssociatedObject(self, &kContentInsetsKey, NSStringFromUIEdgeInsets(contentInsets), OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &kshowContentInsetsKey, @YES, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIEdgeInsets)contentInsets {
    return UIEdgeInsetsFromString(objc_getAssociatedObject(self, &kContentInsetsKey));

}

+ (void)load {

    [super load];

    // class_getInstanceMethod()

    Method fromMethod = class_getInstanceMethod([self class], @selector(drawTextInRect:));

    Method toMethod = class_getInstanceMethod([self class], @selector(yl_drawTextInRect:));

    // class_addMethod()

    if (!class_addMethod([self class], @selector(drawTextInRect:), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {

        method_exchangeImplementations(fromMethod, toMethod);

    }

}

- (void)yl_drawTextInRect:(CGRect)rect {
    BOOL show = objc_getAssociatedObject(self, &kshowContentInsetsKey);
    if (show) {
        rect = UIEdgeInsetsInsetRect(rect, self.contentInsets);
    }
    [self yl_drawTextInRect:rect];
}
@end
