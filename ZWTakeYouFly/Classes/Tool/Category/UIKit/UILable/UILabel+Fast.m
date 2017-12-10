//
//  UILabel+Fast.m
//  JinSeJiaYuanWang
//
//  Created by XuJunquan on 16/7/25.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "UILabel+Fast.h"

@implementation UILabel (Fast)
+ (UILabel *)labelWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.text = (title != nil) ? (title) : (@"");
    label.textColor = (titleColor != nil) ? (titleColor) : ([UIColor grayColor]);
    //默认属性
    label.font = [UIFont systemFontOfSize:16];
    //默认属性
    label.textAlignment = NSTextAlignmentLeft;
    //默认属性
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    return label;
}

+ (UILabel *)labelWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andAlignment:(NSTextAlignment)alignment andFont:(UIFont *)font{
    UILabel *label = [self labelWithTitle:title andTitleColor:titleColor];
    label.textAlignment = alignment;
    label.font = (font != nil) ? (font) : ([UIFont systemFontOfSize:16]);
    return label;
}
@end
