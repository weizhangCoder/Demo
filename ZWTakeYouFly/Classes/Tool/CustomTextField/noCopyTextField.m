//
//  noCopyTextField.m
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/7/1.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "noCopyTextField.h"

@implementation noCopyTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}


- (void)awakeFromNib{
    [super awakeFromNib];
    self.tintColor = KplaceholderLabelColor;
    [self setValue:KplaceholderLabelColor forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont systemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    
}
@end
