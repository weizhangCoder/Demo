//
//  UIViewController+ZWBaseMethods.h
//  TakeYouFly
//
//  Created by zhangwei on 17/6/15.
//  Copyright © 2017年 zw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZWBaseMethods)

- (void)pop;

- (void)popToRootVc;

- (void)popToVc:(UIViewController *)vc;

- (void)dismiss;

- (void)dismissWithCompletion:(void(^)())completion;

- (void)presentVc:(UIViewController *)vc;

- (void)presentVc:(UIViewController *)vc completion:(void (^)(void))completion;

- (void)pushVc:(UIViewController *)vc;

- (void)removeChildVc:(UIViewController *)childVc;

- (void)addChildVc:(UIViewController *)childVc;


- (void)showLoadingAnimation:(NSString *)message;

- (void)hideLoadingAnimation;

@end
