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

+ (void)load {
    [super load];
    // class_getInstanceMethod()
    Method fromMethod = class_getInstanceMethod([self class], @selector(drawTextInRect:));
    Method toMethod = class_getInstanceMethod([self class], @selector(yl_drawTextInRect:));
    // class_addMethod()
    if (!class_addMethod([self class], @selector(drawTextInRect:), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
    
    // class_getInstanceMethod()
    Method fromMethod2 = class_getInstanceMethod([self class], @selector(textRectForBounds:limitedToNumberOfLines:));
    Method toMethod2 = class_getInstanceMethod([self class], @selector(yl_textRectForBounds:limitedToNumberOfLines:));
    // class_addMethod()
    if (!class_addMethod([self class], @selector(textRectForBounds:limitedToNumberOfLines:), method_getImplementation(toMethod2), method_getTypeEncoding(toMethod2))) {
        method_exchangeImplementations(fromMethod2, toMethod2);
    }
    
}


- (void)setYl_contentEdgeInsets:(UIEdgeInsets)yl_contentEdgeInsets {
    objc_setAssociatedObject(self, &kContentInsetsKey, NSStringFromUIEdgeInsets(yl_contentEdgeInsets), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIEdgeInsets)yl_contentEdgeInsets {
     return UIEdgeInsetsFromString(objc_getAssociatedObject(self, &kContentInsetsKey));
}

- (CGRect)yl_textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect rect = [self yl_textRectForBounds:UIEdgeInsetsInsetRect(bounds,self.yl_contentEdgeInsets) limitedToNumberOfLines:numberOfLines];
    //根据edgeInsets，修改绘制文字的bounds
    rect.origin.x -= self.yl_contentEdgeInsets.left;
    rect.origin.y -= self.yl_contentEdgeInsets.top;
    rect.size.width += self.yl_contentEdgeInsets.left + self.yl_contentEdgeInsets.right;
    rect.size.height += self.yl_contentEdgeInsets.top + self.yl_contentEdgeInsets.bottom;
    return rect;
}

- (void)yl_drawTextInRect:(CGRect)rect {
    rect = UIEdgeInsetsInsetRect(rect, self.yl_contentEdgeInsets);
    [self yl_drawTextInRect:rect];
}
@end
