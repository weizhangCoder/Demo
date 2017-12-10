//
//  UILabel+ChangeLineSpaceAndWordSpace.m
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 17/2/17.
//  Copyright © 2017年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "UILabel+ChangeLineSpaceAndWordSpace.h"

@implementation UILabel (ChangeLineSpaceAndWordSpace)
//改变行间距
+(void)changeLineSpaceForLabel:(UILabel *)label lineSpace:(float)space{
    if (label == nil) return;
    NSString *labelText  = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = space;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
//改变字间距
+(void)changeWordSpaceForLabel:(UILabel *)label wordSpace:(float)space{
    if (label == nil) return;
        NSString *labelText  = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];

}
//改变行间距
+(void)changeLineSpaceForLabel:(UILabel *)label withLineSpace:(float)linespace  wordSpace:(float)wordSpace{
    if (label == nil) return;
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:linespace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];

}

//改变行间距
+(CGSize )changeLineSpaceForLabel:(UILabel *)label withLineSpace:(float)linespace  wordSpace:(float)wordSpace maxSize:(CGSize)maxSize{
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:linespace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    
    CGSize labelSize = [label sizeThatFits:maxSize];
//    [label sizeToFit];
    return labelSize;
}
@end
