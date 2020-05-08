//
//  YLRouterNavigation.h
//  YLKits
//
//  Created by Conner on 2019/10/21.
//  Copyright © 2019 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLRouterNavigation : NSObject
/**
 Get current ViewController

 @return Current ViewController
 */
+ (UIViewController *)currentViewController;

/**
 Get current NavigationViewController

 @return return Current NavigationViewController
 */
+ (nullable UINavigationController *)currentNavigationViewController;

/**
 Push ViewController

 @param viewController Target ViewController
 @param animated Whether to use animation
 */
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 Push ViewController，can set whether the current ViewController is still reserved.

 @param viewController Target ViewController
 @param replace whether the current ViewController is still reserved
 @param animated Whether to use animation
 */
+ (void)pushViewController:(UIViewController *)viewController replace:(BOOL)replace animated:(BOOL)animated;

/**
 Push multiple ViewController

 @param viewControllers ViewController Array
 @param animated Whether to use animation
 */
+ (void)pushViewControllerArray:(NSArray *)viewControllers animated:(BOOL)animated;

/**
 present ViewController

 @param viewController Target ViewController
 @param animated Whether to use animation
 @param completion Callback
 */
+ (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;

/**
 Close the current ViewController, push, present universal

 @param animated Whether to use animation
 */
+ (void)closeViewControllerAnimated:(BOOL)animated;
@end

NS_ASSUME_NONNULL_END
