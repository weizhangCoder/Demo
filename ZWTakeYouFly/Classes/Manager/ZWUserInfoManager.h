//
//  ZWUserInfoManager.h
//  TakeYouFly
//
//  Created by zhangwei on 17/6/19.
//  Copyright © 2017年 zw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWUserInfoModel.h"


@interface ZWUserInfoManager : NSObject
+ (instancetype)sharedManager;

/**
 *  登录成功
 */
- (void)didLoginInWithUserInfo:(id)userInfo;

/**
 *  退出
 */
- (void)didLoginOut;

/**
 *  获取用户信息
 */
- (ZWUserInfoModel *)currentUserInfo;
/**
 *  获取用户当前的UserId
 */
- (NSString *)currentUserid;
/**
 *  更新缓存中的用户信息
 */
- (void)resetUserInfoWithUserInfo:(ZWUserInfoModel *)userInfo;

/**
 *  用来记录是否是登陆状态
 */
@property (nonatomic, assign) BOOL isLogin;
@end
