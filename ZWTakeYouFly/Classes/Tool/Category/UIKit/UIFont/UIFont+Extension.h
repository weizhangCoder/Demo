//
//  UIFont+Extension.h
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/7/22.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)
/**
 *  根据不同的设置返回不同的字体
 */
+ (UIFont *)fontWithDevice:(CGFloat)fontSize;
/**
 * 加粗
 */
+ (UIFont *)boldfontWithDevice:(CGFloat)fontSize;



#pragma mark - takeyoufly
+ (UIFont *) fontBoldTitle_18;
+ (UIFont *) fontTitle_18;
+ (UIFont *) fontBoldTitle_15;
+ (UIFont *) fontTitle_15;
+ (UIFont *) fontBoldTitle_13;
+ (UIFont *) fontTitle_13;
+ (UIFont *) fontBoldTitle_11;
+ (UIFont *) fontTitle_11;








#pragma mark - Common
+ (UIFont *)fontNavBarTitle;

#pragma mark - Conversation
+ (UIFont *)fontConversationUsername;
+ (UIFont *)fontConversationDetail;
+ (UIFont *)fontConversationTime;

#pragma mark - Friends
+ (UIFont *) fontFriendsUsername;

#pragma mark - Mine
+ (UIFont *)fontMineNikename;
+ (UIFont *)fontMineUsername;

#pragma mark - Setting
+ (UIFont *)fontSettingHeaderAndFooterTitle;


#pragma mark - Chat
+ (UIFont *)fontTextMessageText;
@end
