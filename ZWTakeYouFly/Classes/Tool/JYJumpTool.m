//
//  JYJumpTool.m
//  ShouBa
//
//  Created by FW on 2017/10/11.
//  Copyright © 2017年 silence. All rights reserved.
//

#import "JYJumpTool.h"
#import "ZWNavigationViewController.h"

@implementation JYJumpTool

+ (void)pushViewController:(UIViewController *)vc animated:(BOOL)animated
{
    UIViewController * currentViewController = [JYJumpTool currentViewController];
    if (currentViewController.navigationController)
    {
        [((ZWNavigationViewController *)currentViewController.navigationController) pushViewController:vc animated:animated];
    }
}

+ (void)presentViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void(^)())completion
{
    UIViewController * currentViewController = [JYJumpTool currentViewController];
    [currentViewController presentViewController:vc animated:animated completion:completion];
}

+ (UIViewController *)currentViewController
{
    UIViewController* vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1)
    {
        if ([vc isKindOfClass:[UITabBarController class]])
        {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        
        if ([vc isKindOfClass:[ZWNavigationViewController class]])
        {
            vc = ((ZWNavigationViewController*)vc).viewControllers.lastObject;
        }
        
        if (vc.presentedViewController)
        {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    return vc;
}

@end
