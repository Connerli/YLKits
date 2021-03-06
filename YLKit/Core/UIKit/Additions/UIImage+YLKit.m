//
//  UIImage+YLKit.m
//  YLKits
//
//  Created by Conner on 2019/8/16.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "UIImage+YLKit.h"

@implementation UIImage (YLKit)

+ (UIImage * _Nonnull)yl_imageWithColor:(UIColor * _Nonnull)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
