//
//  UIImage+YLKit.h
//  YLProject
//
//  Created by Conner on 2019/8/16.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YLKit)
/**
 *  Create an image from a given color
 *
 *  @param color Color value
 *
 *  @return Returns the created UIImage
 */
+ (UIImage * _Nonnull)imageWithColor:(UIColor * _Nonnull)color;
@end

NS_ASSUME_NONNULL_END
