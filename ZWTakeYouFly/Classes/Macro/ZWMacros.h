//
//  ZWMacros.h
//  TakeYouFly
//
//  Created by zhangwei on 17/6/16.
//  Copyright © 2017年 zw. All rights reserved.
//  宏

#ifndef ZWMacros_h
#define ZWMacros_h

/**
 常用宏定义
 */
//屏幕高度
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
//屏幕宽度
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
//tabbar的高度
#define kTabBarHeigth 49
// 导航栏高度
#define kNavigationHeight 64
//细线
#define JYSINGLE_LINE_WIDTH   (1.0 / [UIScreen mainScreen].scale)
//遮罩的透明度是
#define KColorAlpha 0.6

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define StrongSelf(strongSelf)__strong __typeof(weakSelf)strongSelf = weakSelf;

//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

#define kStringIsEmptyReturn(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? @"" : str )

#define kImageNamed(name) [UIImage imageNamed:[NSString stringWithFormat:@"%@",name]]
#define KstringWithStr(str) [NSString stringWithFormat:@"%@",str]
#define KstringWithInt(Int) [NSString stringWithFormat:@"%ld",Int]


//iphone6屏幕比例
#define KWidth_Scale    [UIScreen mainScreen].bounds.size.width/375.0f

//轮播图的宽高
#define KCDCYLH    100
#define Kcell_0_H   90

//获取系统版本
#define XZSystemVersion ([UIDevice currentDevice].systemVersion.floatValue)
#define iOS10           (XZSystemVersion >= 10.0)
#define iOS9            (XZSystemVersion >= 9.0)
#define iOS8            (XZSystemVersion >= 8.0)
#define iOS7            (XZSystemVersion >= 7.0)
#define iOS6            (XZSystemVersion <  7.0)



#define WEAKSELF __weak typeof(self) weakSelf = self
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define FIT_WIDTH [UIScreen mainScreen].bounds.size.width/375
#define KSelectBorderColor      [UIColor colorWithRed:253/255.0 green:206/255.0 blue:41/255.0 alpha:1]
#define KUnSelectBorderColor    [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1]
#define KButtonColor            [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]

/// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

///  View加边框
#define ViewBorder(View, BorderColor, BorderWidth )\
\
View.layer.borderColor = BorderColor.CGColor;\
View.layer.borderWidth = BorderWidth;


/**
 单例宏定义，可用可不用
 */
// .h文件
#define JYSingletonH(name) + (instancetype)shared##name;

// .m文件
#define JYSingletonM(name) \
static id _instance = nil; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}
#endif /* ZWMacros_h */
