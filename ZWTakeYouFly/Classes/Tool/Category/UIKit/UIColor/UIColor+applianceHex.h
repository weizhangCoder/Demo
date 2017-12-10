//
//  UIColor+applianceHex.h
//  张云杰
//
//  Created by mac on 16/3/13.
//  Copyright © 2016年 com.jyall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (applianceHex)
/*
 *  输入6位数返回一个颜色值
 */
+ (UIColor *)colorFromHex:(NSString *)hex;
/*
 *  输入6位数和透明度返回一个颜色值
 */
+ (UIColor *)colorFromHex:(NSString *)hex alpha:(CGFloat)alpha;


//背景
+ (UIColor *)colorBackWithBackView;
//主题
+ (UIColor *)colorTheme;
//虚线
+ (UIColor *)colorLine;
//文字
+ (UIColor *)colorTextBlack;
//未输入颜色
+ (UIColor *)colorPlaceholderTextBlack;


//#pragma mark - # 字体
//+ (UIColor *)colorBackWithBackView; //控制器的背景颜色
//
//+ (UIColor *)colorTextBlack;
//+ (UIColor *)colorTextGray;
//+ (UIColor *)colorTextGray1;
//
//
//#pragma mark - 灰色
//+ (UIColor *)colorGrayBG;           // 浅灰色默认背景
//+ (UIColor *)colorGrayCharcoalBG;   // 较深灰色背景（聊天窗口, 朋友圈用）
//+ (UIColor *)colorGrayLine;
//+ (UIColor *)colorGrayForChatBar;
//+ (UIColor *)colorGrayForMoment;
//
//
//
//#pragma mark - 绿色
//+ (UIColor *)colorGreenDefault;
//
//
//#pragma mark - 蓝色
//+ (UIColor *)colorBlueMoment;
//
//
//#pragma mark - 黑色
//+ (UIColor *)colorBlackForNavBar;
//+ (UIColor *)colorBlackBG;
//+ (UIColor *)colorBlackAlphaScannerBG;
//+ (UIColor *)colorBlackForAddMenu;
//+ (UIColor *)colorBlackForAddMenuHL;
@end
