//
//  ZWProgressHUD.m
//  TakeYouFly
//
//  Created by zhangwei on 17/7/4.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWProgressHUD.h"
#import "LCProgressHUD.h"

#define TIME 2.0f

@implementation ZWProgressHUD
+ (void)showMessage:(NSString *)text{
     [LCProgressHUD showMessage:text];
     
     [NSTimer scheduledTimerWithTimeInterval:TIME
                                      target:self
                                    selector:@selector(hideHUD)
                                    userInfo:nil
                                     repeats:NO];
}

+ (void)showSuccess:(NSString *)text{
     [LCProgressHUD showSuccess:text];
}

+ (void)showFailure:(NSString *)text{
     [LCProgressHUD showFailure:text];
}

+ (void)showWaitting{
    [LCProgressHUD showLoading:@"正在加载"];
}

+ (void)showInfoMsg:(NSString *)text{
     [LCProgressHUD showInfoMsg:text];
}

+ (void)hideHUD{
   [LCProgressHUD hide];
}

@end
