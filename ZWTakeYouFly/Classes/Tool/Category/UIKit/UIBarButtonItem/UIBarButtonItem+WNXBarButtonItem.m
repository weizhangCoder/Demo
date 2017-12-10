//
//  UIBarButtonItem+WNXBarButtonItem.m
//  WNXHuntForCity
//
//  Created by MacBook on 15/6/29.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//

#import "UIBarButtonItem+WNXBarButtonItem.h"

@implementation UIBarButtonItem (WNXBarButtonItem)

+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target isLeftButton:(BOOL)isleft action:(SEL)action
{
    UIImage *normalImage = [UIImage imageNamed:image];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 30);
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    if (isleft) {
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }else{
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
//        button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
//    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action
{
    UIImage *normalImage = [UIImage imageNamed:image];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
//    CGSize titleSize = [titleSize bo]
//    UIFont *temp1 = [UIFont fontWithName:@"Helvetica Neue" size:12];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    //  NSDictionary *attributes = @{NSFontAttributeName:label3.font};
    [btn.titleLabel sizeThatFits:CGSizeMake(100, 20)];
    CGSize size = [title sizeWithAttributes: [NSDictionary dictionaryWithObjectsAndKeys:btn.titleLabel.font,NSFontAttributeName,nil]];
    
    btn.frame = CGRectMake(0, 0, size.width+15, 30);
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    //    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -size.width-25);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -size.width-5, 0, 0);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

+ (UIBarButtonItem *)initWithNormalImageBig:(NSString *)image target:(id)target action:(SEL)action
{
    UIImage *normalImage = [UIImage imageNamed:image];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height
{
    UIImage *normalImage = [UIImage imageNamed:image];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, width, height);
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 30);
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn setTitle:title forState:UIControlStateNormal];
    if (!titleColor) {
        titleColor = [UIColor blackColor];
    }
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}




@end
