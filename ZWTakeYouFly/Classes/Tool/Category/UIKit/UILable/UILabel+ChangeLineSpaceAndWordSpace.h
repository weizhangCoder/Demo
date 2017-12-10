//
//  UILabel+ChangeLineSpaceAndWordSpace.h
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 17/2/17.
//  Copyright © 2017年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ChangeLineSpaceAndWordSpace)
//改变行间距
+(void)changeLineSpaceForLabel:(UILabel *)label lineSpace:(float)space;
//改变字间距
+(void)changeWordSpaceForLabel:(UILabel *)label wordSpace:(float)space;
//改变行间距
+(void)changeLineSpaceForLabel:(UILabel *)label withLineSpace:(float)linespace  wordSpace:(float)wordSpace;

+(CGSize )changeLineSpaceForLabel:(UILabel *)label withLineSpace:(float)linespace  wordSpace:(float)wordSpace maxSize:(CGSize)maxSize;
@end
