//
//  UIButton+fast.m
//  TakeYouFly
//
//  Created by zhangwei on 17/6/21.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "UIButton+fast.h"

@implementation UIButton (fast)

+ (UIButton *)buttonWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor{
    UIButton *btn = [UIButton buttonWithType:0];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    if (titleColor == nil) {
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    [btn setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateDisabled];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"save_btn"] forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    return btn;
}
//
//static UIButton *createResultLabel() {
//    UIButton *btn = [UIButton buttonWithType:0];
//    btn.titleLabel.font = [UIFont systemFontOfSize:14];
//    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor blueColor];
//    btn.layer.cornerRadius = 5;
//    btn.layer.masksToBounds = YES;
//    return btn;
//}
@end
