//
//  NSMutableAttributedString+ZWStrAttribued.m
//  TakeYouFly
//
//  Created by zhangwei on 17/6/29.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "NSMutableAttributedString+ZWStrAttribued.h"

@implementation NSMutableAttributedString (ZWStrAttribued)
+ (NSMutableAttributedString *)levelAttributedStartText:(NSString *)starText endText:(NSString *)endText{
    
    NSMutableAttributedString *allString = [[NSMutableAttributedString alloc] init];
    
    NSMutableAttributedString *foutnumberString = [[NSMutableAttributedString alloc] initWithString:starText];
    [foutnumberString addAttributes:@{NSFontAttributeName:[UIFont fontTitle_13],NSForegroundColorAttributeName:[UIColor colorTextBlack]} range:NSMakeRange(0, foutnumberString.string.length)];
    
    [allString appendAttributedString:foutnumberString];
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:@"hall_icon_36"];
    attch.bounds = CGRectMake(0, -3, 15, 15);
    // 创建带有图片的富文本
    NSAttributedString *phoneString = [NSAttributedString attributedStringWithAttachment:attch];
    [allString appendAttributedString:phoneString];
    
    NSMutableAttributedString *numberString = [[NSMutableAttributedString alloc] initWithString:endText];
    [numberString addAttributes:@{NSFontAttributeName:[UIFont fontTitle_13],NSForegroundColorAttributeName:[UIColor colorTextBlack]} range:NSMakeRange(0, numberString.string.length)];
    
    [allString appendAttributedString:numberString];
    
    return allString;
}
@end
