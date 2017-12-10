//
//  UIFont+Extension.m
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/7/22.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "UIFont+Extension.h"

#define kFontScreenWidth  [[UIScreen mainScreen] bounds].size.width

@implementation UIFont (Extension)
// = [[UIScreen mainScreen] bounds].size.width;

+ (UIFont *)fontWithDevice:(CGFloat)fontSize {
    if (kFontScreenWidth > 375) {
        fontSize = fontSize+1.0;
    }else if (kFontScreenWidth == 375){
        fontSize = fontSize;
    }else if (kFontScreenWidth == 320){
        fontSize = fontSize - 2;
    }
    
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}


+ (UIFont *)boldfontWithDevice:(CGFloat)fontSize {
    if (kFontScreenWidth > 375) {
        fontSize = fontSize+1.5;
    }else if (kFontScreenWidth == 375){
        fontSize = fontSize;
    }else if (kFontScreenWidth == 320){
        fontSize = fontSize - 2;
    }
    UIFont *font = [UIFont boldSystemFontOfSize:fontSize];
    return font;
}
#pragma mark - takeyoufly
+ (UIFont *) fontBoldTitle_18
{
    return [UIFont boldSystemFontOfSize:18];
}
+ (UIFont *) fontTitle_18
{
    return [UIFont systemFontOfSize:18];
    
}

+ (UIFont *) fontBoldTitle_15
{
    return [UIFont boldSystemFontOfSize:15];
}
+ (UIFont *) fontTitle_15
{
    return [UIFont systemFontOfSize:15];
    
}

+ (UIFont *) fontBoldTitle_13
{
    return [UIFont boldSystemFontOfSize:13];
}
+ (UIFont *) fontTitle_13
{
    return [UIFont systemFontOfSize:13];
    
}

+ (UIFont *) fontBoldTitle_11
{
    return [UIFont boldSystemFontOfSize:11];
}
+ (UIFont *) fontTitle_11
{
    return [UIFont systemFontOfSize:11];
    
}








+ (UIFont *) fontNavBarTitle
{
    return [UIFont systemFontOfSize:17.0f];
}

+ (UIFont *) fontConversationUsername
{
    return [UIFont systemFontOfSize:17.0f];
}

+ (UIFont *) fontConversationDetail
{
    return [UIFont systemFontOfSize:14.0f];
}

+ (UIFont *) fontConversationTime
{
    return [UIFont systemFontOfSize:12.5f];
}

+ (UIFont *) fontFriendsUsername
{
    return [UIFont systemFontOfSize:17.0f];
}

+ (UIFont *) fontMineNikename
{
    return [UIFont systemFontOfSize:17.0f];
}

+ (UIFont *) fontMineUsername
{
    return [UIFont systemFontOfSize:14.0f];
}

+ (UIFont *) fontSettingHeaderAndFooterTitle
{
    return [UIFont systemFontOfSize:14.0f];
}

+ (UIFont *)fontTextMessageText
{
    CGFloat size = [[NSUserDefaults standardUserDefaults] doubleForKey:@"CHAT_FONT_SIZE"];
    if (size == 0) {
        size = 16.0f;
    }
    return [UIFont systemFontOfSize:size];
}
@end
