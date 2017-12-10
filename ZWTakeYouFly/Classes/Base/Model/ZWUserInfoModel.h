//
//  ZWUserInfoModel.h
//  TakeYouFly
//
//  Created by zhangwei on 17/6/19.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWBaseModel.h"

@interface ZWUserInfoModel : ZWBaseModel
@property (nonatomic, strong) NSString * nick_name;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString * create_time;
@property (nonatomic, strong) NSString * open_id;
@property (nonatomic, strong) NSString * sex;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * update_time;
@property (nonatomic, strong) NSString * head_img;


@end
