//
//  UITextFieldDisTance.m
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/4/7.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "UITextFieldDisTance.h"

@implementation UITextFieldDisTance

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (void)drawPlaceholderInRect:(CGRect)rect{
////    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
////    textAttrs[NSForegroundColorAttributeName]=UICOLOR_RGB_Alpha(0x999999, 1);
////    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:14];
////    
////    [self.placeholder drawInRect:CGRectMake(0,0, rect.size.width, rect.size.height) withAttributes:textAttrs];
//
//}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.tintColor = KplaceholderLabelColor;
    [self setValue:KplaceholderLabelColor forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont systemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];

}
@end
