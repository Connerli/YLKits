//
//  YLRouterNavigation.m
//  YLKitsDemo
//
//  Created by Conner on 2019/10/21.
//  Copyright © 2019 Conner. All rights reserved.
//

#import "YLRouterNavigation.h"

@implementation YLRouterNavigation

#pragma mark - Get
+ (id<UIApplicationDelegate>)applicationDelegate {
    return [UIApplication sharedApplication].delegate;
}

+ (UINavigationController*)currentNavigationViewController {
    UIViewController* currentViewController = [self currentViewController];
    return currentViewController.navigationController;
}

+ (UIViewController *)currentViewController {
    UIViewController* rootViewController = self.applicationDelegate.window.rootViewController;
    return [self currentViewControllerFrom:rootViewController];
}

+ (UIViewController*)currentViewControllerFrom:(UIViewController*)viewController {
    
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController* navigationController = (UINavigationController *)viewController;
        return [self currentViewControllerFrom:navigationController.viewControllers.lastObject];
        
    } else if([viewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController* tabBarController = (UITabBarController *)viewController;
        return [self currentViewControllerFrom:tabBarController.selectedViewController];
        
    } else if(viewController.presentedViewController != nil) {
        
        return [self currentViewControllerFrom:viewController.presentedViewController];
        
    } else {
        
        return viewController;
        
    }
}

#pragma mark - Push
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController) {
        [self pushViewControllerArray:@[viewController] animated:animated replace:NO];
    }
}

+ (void)pushViewController:(UIViewController *)viewController replace:(BOOL)replace animated:(BOOL)animated {
    if (viewController) {
        [self pushViewControllerArray:@[viewController] animated:animated replace:replace];
    }
}

+ (void)pushViewControllerArray:(NSArray *)viewControllers animated:(BOOL)animated {
    [self pushViewControllerArray:viewControllers animated:animated replace:NO];
}

+ (void)pushViewControllerArray:(NSArray *)viewControllers animated:(BOOL)animated replace:(BOOL)replace {
    if (viewControllers.count == 0) return;
    
    UINavigationController *currentNav = [self currentNavigationViewController];
    if (!currentNav) return;
    
    NSArray *oldViewCtrls = currentNav.childViewControllers;
    NSArray *newViewCtrls = nil;
    
    if (replace) {
        newViewCtrls = [[oldViewCtrls subarrayWithRange:NSMakeRange(0, oldViewCtrls.count-1)] arrayByAddingObjectsFromArray:viewControllers];
    }else {
        newViewCtrls = [oldViewCtrls arrayByAddingObjectsFromArray:viewControllers];
    }
    
    [currentNav setViewControllers:newViewCtrls animated:animated];
}

#pragma mark - Present
+ (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    if (!viewController) return;
    
    UIViewController *currentCtrl = [self currentViewController];
    if (!currentCtrl) return;
    
    [currentCtrl presentViewController:viewController animated:animated completion:completion];
}

#pragma mark - Close
+ (void)closeViewControllerAnimated:(BOOL)animated {
    UIViewController *currentViewController = [self currentViewController];
    if(!currentViewController) return;
    
    if(currentViewController.navigationController) {
        if(currentViewController.navigationController.viewControllers.count == 1) {
            if(currentViewController.presentingViewController) {
                [currentViewController dismissViewControllerAnimated:animated completion:nil];
            }
        } else {
            [currentViewController.navigationController popViewControllerAnimated:animated];
        }
    } else if(currentViewController.presentingViewController) {
        [currentViewController dismissViewControllerAnimated:animated completion:nil];
    }
}
@end
