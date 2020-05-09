//
//  UIButton+YLKit.h
//  YLKits
//
//  Created by Conner on 2019/5/29.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YLButtonLayout){
    /** 正常位置，图左字右 */
    YLButtonLayoutNormal,
    /** 图右字左 */
    YLButtonLayoutImageRight,
    /** 图上字下 */
    YLButtonLayoutImageTop,
    /** 图下字上 */
    YLButtonLayoutImageBottom,
};

@interface UIButton (YLKit)
/**
 设置按钮文字图片位置
 
 @param status 类型
 @param margin 间隙
 */
- (void)yl_layoutWithStatus:(YLButtonLayout)status andMargin:(CGFloat)margin;

/**
 *  Create an UIButton in a frame
 *
 *  @param frame Button's frame
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame;

/**
 *  Create an UIButton in a frame with a title and a clear color
 *
 *  @param frame Button's frame
 *  @param title Button's title, the title color will be white
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nullable)title;

/**
 *  Create an UIButton in a frame with a title and a background image
 *
 *  @param frame           Button's frame
 *  @param title           Button's title
 *  @param backgroundImage Button's background image
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nullable)title
                       backgroundImage:(UIImage * _Nullable)backgroundImage;

/**
 *  Create an UIButton in a frame with a title, a background image and highlighted background image
 *
 *  @param frame                      Button's frame
 *  @param title                      Button's title
 *  @param backgroundImage            Button's background image
 *  @param highlightedBackgroundImage Button's highlighted background image
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nullable)title
                       backgroundImage:(UIImage * _Nullable)backgroundImage
            highlightedBackgroundImage:(UIImage * _Nullable)highlightedBackgroundImage;

/**
 *  Create an UIButton in a frame with a title and a color
 *
 *  @param frame Button's frame
 *  @param title Button's title
 *  @param color Button's color, the highlighted color will be automatically created
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nonnull)title
                                 color:(UIColor * _Nonnull)color;

/**
 *  Create an UIButton in a frame with a title, a color and highlighted color
 *
 *  @param frame            Button's frame
 *  @param title            Button's title
 *  @param color            Button's color
 *  @param highlightedColor Button's highlighted color
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 title:(NSString * _Nonnull)title
                                 color:(UIColor * _Nonnull)color
                      highlightedColor:(UIColor * _Nonnull)highlightedColor;

/**
 *  Create an UIButton in a frame with a color
 *
 *  @param frame Button's frame
 *  @param color Button's color, the highlighted color will be automatically created
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 color:(UIColor * _Nonnull)color;

/**
 *  Create an UIButton in a frame with a color and highlighted color
 *
 *  @param frame            Button's frame
 *  @param color            Button's color
 *  @param highlightedColor Button's highlighted color
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 color:(UIColor * _Nonnull)color
                      highlightedColor:(UIColor * _Nonnull)highlightedColor;

/**
 *  Create an UIButton in a frame with an image
 *
 *  @param frame Button's frame
 *  @param image Button's image
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 image:(UIImage * _Nonnull)image;

/**
 *  Create an UIButton in a frame with an image
 *
 *  @param frame            Button's frame
 *  @param image            Button's image
 *  @param highlightedImage Button's highlighted image
 *
 *  @return Returns the UIButton instance
 */
+ (instancetype _Nonnull)initWithFrame:(CGRect)frame
                                 image:(UIImage * _Nonnull)image
                      highlightedImage:(UIImage * _Nullable)highlightedImage;

/**
 *  Set the title color
 *
 *  @param color Font color, the highlighted color will be automatically created
 */
- (void)setTitleColor:(UIColor * _Nonnull)color;

/**
 *  Set the title color and highlighted color
 *
 *  @param color            Button's color
 *  @param highlightedColor Button's highlighted color
 */
- (void)setTitleColor:(UIColor * _Nonnull)color
     highlightedColor:(UIColor * _Nullable)highlightedColor;
@end

NS_ASSUME_NONNULL_END
