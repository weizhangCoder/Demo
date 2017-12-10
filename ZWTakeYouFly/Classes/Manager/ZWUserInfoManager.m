//
//  ZWUserInfoManager.m
//  TakeYouFly
//
//  Created by zhangwei on 17/6/19.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWUserInfoManager.h"
#import "NHFileCacheManager.h"
#import "NHCommonConstant.h"

static ZWUserInfoManager *_singleton = nil;
@implementation ZWUserInfoManager
+ (instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _singleton = [[ZWUserInfoManager alloc] init];
    });
    return _singleton;
}

// 当前用户信息
- (ZWUserInfoModel *)currentUserInfo {
    
    id obj = [NHFileCacheManager getObjectByFileName:NSStringFromClass([ZWUserInfoModel class])];
    if (obj != nil) {
        return  obj;
    }
    return nil;
}
- (NSString *)currentUserid{
    
  return [NSString stringWithFormat:@"%ld",(long)[ZWUserInfoManager sharedManager].currentUserInfo.userId];
}

// 重置用户信息
- (void)resetUserInfoWithUserInfo:(ZWUserInfoModel *)userInfo {
    [userInfo archive];
}

// 登陆
- (void)didLoginInWithUserInfo:(id)userInfo {
    
    ZWUserInfoModel *userinfo = [ZWUserInfoModel modelWithDictionary:userInfo];
    [userinfo archive];
    
    [NHFileCacheManager saveUserData:@YES forKey:kNHHasLoginFlag];
}

// 退出登陆
- (void)didLoginOut {
    [NHFileCacheManager removeObjectByFileName:NSStringFromClass([ZWUserInfoModel class])];
    
    [NHFileCacheManager saveUserData:@NO forKey:kNHHasLoginFlag];
}

// 判断是否是登陆状态
- (BOOL)isLogin {
    return [[NSUserDefaults standardUserDefaults] boolForKey:kNHHasLoginFlag];
}

@end
