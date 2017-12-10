//
//  ZWProgressHUD.h
//  TakeYouFly
//
//  Created by zhangwei on 17/7/4.
//  Copyright © 2017年 zw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWProgressHUD : NSObject

+ (void)showMessage:(NSString *)text;

+ (void)showSuccess:(NSString *)text;

+ (void)showFailure:(NSString *)text;

+ (void)showWaitting;

+ (void)showInfoMsg:(NSString *)text;

+ (void)hideHUD;

@end
