//
//  UIButton+YLKit.m
//  YLKits
//
//  Created by Conner on 2019/5/29.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "UIButton+YLKit.h"
#import "UIImage+YLKit.h"

@implementation UIButton (YLKit)

- (void)yl_layoutWithStatus:(YLButtonLayout)status andMargin:(CGFloat)margin{
    CGFloat imgWidth = self.imageView.bounds.size.width;
    CGFloat imgHeight = self.imageView.bounds.size.height;
    CGFloat labWidth = self.titleLabel.bounds.size.width;
    CGFloat labHeight = self.titleLabel.bounds.size.height;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (labWidth < frameSize.width) {
        labWidth = frameSize.width;
    }
    CGFloat kMargin = margin/2.0;
    switch (status) {
        case YLButtonLayoutNormal://图左字右
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, -kMargin, 0, kMargin)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, kMargin, 0, -kMargin)];
            break;
        case YLButtonLayoutImageRight://图右字左
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, labWidth + kMargin, 0, -labWidth - kMargin)];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imgWidth - kMargin, 0, imgWidth + kMargin)];
            break;
        case YLButtonLayoutImageTop://图上字下
            [self setImageEdgeInsets:UIEdgeInsetsMake(0,0, labHeight + margin, -labWidth)];
            
            [self setTitleEdgeInsets:UIEdgeInsetsMake(imgHeight + margin, -imgWidth, 0, 0)];
            break;
        case YLButtonLayoutImageBottom://图下字上
            [self setImageEdgeInsets:UIEdgeInsetsMake(labHeight + margin,0, 0, -labWidth)];
            
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imgWidth, imgHeight + margin, 0)];
            
            break;
        default:
            break;
    }
}

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame {
    return [UIButton initWithFrame:frame title:nil];
}

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame title:(NSString * _Nullable)title {
    return [UIButton initWithFrame:frame title:title backgroundImage:nil];
}

+ (instancetype _Nonnull )initWithFrame:(CGRect)frame title:(NSString * _Nullable)title backgroundImage:(UIImage * _Nullable)backgroundImage {
    return [UIButton initWithFrame:frame title:title backgroundImage:backgroundImage highlightedBackgroundImage:nil];
}

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame title:(NSString * _Nullable)title backgroundImage:(UIImage * _Nullable)backgroundImage highlightedBackgroundImage:(UIImage * _Nullable)highlightedBackgroundImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
    
    return button;
}

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame title:(NSString * _Nonnull)title color:(UIColor * _Nonnull)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton initWithFrame:frame title:title backgroundImage:[UIImage yl_imageWithColor:color] highlightedBackgroundImage:[UIImage yl_imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame title:(NSString * _Nonnull)title color:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nonnull)highlightedColor {
    return [UIButton initWithFrame:frame title:title backgroundImage:[UIImage yl_imageWithColor:color] highlightedBackgroundImage:[UIImage yl_imageWithColor:highlightedColor]];
}

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame color:(UIColor * _Nonnull)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton initWithFrame:frame title:nil backgroundImage:[UIImage yl_imageWithColor:color] highlightedBackgroundImage:[UIImage yl_imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame color:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nonnull)highlightedColor {
    return [UIButton initWithFrame:frame title:nil backgroundImage:[UIImage yl_imageWithColor:color] highlightedBackgroundImage:[UIImage yl_imageWithColor:highlightedColor]];
}

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image {
    return [UIButton initWithFrame:frame image:image highlightedImage:nil];
}

+ (instancetype _Nonnull)initWithFrame:(CGRect)frame image:(UIImage * _Nonnull)image highlightedImage:(UIImage * _Nullable)highlightedImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    
    return button;
}

- (void)setTitleColor:(UIColor * _Nonnull)color {
    [self setTitleColor:color highlightedColor:[color colorWithAlphaComponent:0.4]];
}

- (void)setTitleColor:(UIColor * _Nonnull)color highlightedColor:(UIColor * _Nullable)highlightedColor {
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
}
@end
