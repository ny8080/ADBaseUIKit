//
//  UIViewController+Helper.m
//  Pods
//
//  Created by tripleCC on 12/17/16.
//
//
#import "UIViewController+TopViewController.h"

@implementation UIViewController (TopViewController)
- (void)tdf_removeFromNavigationController {
    NSMutableArray *viewControllers = self.navigationController.viewControllers.mutableCopy;

    [viewControllers removeObject:self];
    self.navigationController.viewControllers = viewControllers;
}

- (UIViewController *)tdf_topViewController{
    return [self tdf_topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController *)tdf_topViewController:(UIViewController *)rootViewController
{
    // 适配掌柜模块移植收银App问题，根控制器表现不一致
    // TDFTopMostControllerProtocol 在 TDFTopMostController 模块中
    if ([rootViewController conformsToProtocol:NSProtocolFromString(@"TDFTopMostControllerProtocol")]) {
        return [rootViewController performSelector:@selector(tdf_visibleViewController)];
    }
    
    if (rootViewController.presentedViewController == nil) {
        return rootViewController;
    }
    
    if ([rootViewController.presentedViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self tdf_topViewController:lastViewController];
    }
    
    UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
    return [self tdf_topViewController:presentedViewController];
}

- (UINavigationController *)tdf_topNavigationController {
    UIViewController *viewController = [self tdf_topViewController];
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)viewController;
    } else {
        return viewController.navigationController;
    }
}
@end
