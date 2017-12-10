//
//  UILabel+Fast.h
//  JinSeJiaYuanWang
//
//  Created by XuJunquan on 16/7/25.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Fast)
/**
 *  快速创建label
 *
 *  @param title        标题
 *  @param titleColor   标题颜色
 *  @return label       label实例
 */
+ (UILabel *)labelWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor;

/**
 *  快速创建label
 *
 *  @param title        标题
 *  @param titleColor   标题颜色
 *  @param alignment    对齐方式
 *  @param font         字体
 *  @return label       label实例
 */
+ (UILabel *)labelWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andAlignment:(NSTextAlignment)alignment andFont:(UIFont *)font;

@end
