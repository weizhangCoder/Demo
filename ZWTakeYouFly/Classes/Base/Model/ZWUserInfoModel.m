//
//  ZWUserInfoModel.m
//  TakeYouFly
//
//  Created by zhangwei on 17/6/19.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWUserInfoModel.h"

@implementation ZWUserInfoModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"userId" : @"id"
             };
}


@end
