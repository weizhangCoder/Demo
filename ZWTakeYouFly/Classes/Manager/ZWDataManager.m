//
//  ZWDataManager.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/15.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWDataManager.h"
#import "HGSpecialModel.h"



@implementation ZWDataManager

JYSingletonM(ZWDataManager)

- (NSArray *)dataAarry{
    if (_dataAarry == nil) {
        _dataAarry = [[NSArray alloc]init];
        NSArray *array = @[
                       @{
                           @"companyName" : @"小米科技有限公司",
                           @"companyIcon" : @"u236",
                           @"companyCeo" : @"法定代表人\n雷军",
                           @"companyMoney" : @"注册资本\n13200万元人民币",
                           @"companyStarTime" : @"注册时间\n2010-03-03",
                           },
                       @{
                           @"companyName" : @"万科企业股份有限公司",
                           @"companyIcon" : @"u272",
                           @"companyCeo" : @"法定代表人\n郁亮",
                           @"companyMoney" : @"注册资本\n1099521.0218万元人民币",
                           @"companyStarTime" : @"注册时间\n1984-05-30",
                           },
                       @{
                           @"companyName" : @"北京宝亿嵘影业有限公司",
                           @"companyIcon" : @"u292",
                           @"companyCeo" : @"法定代表人\n任晓妍",
                           @"companyMoney" : @"注册资本\n2000万元人民币",
                           @"companyStarTime" : @"注册时间\n2004-05-18",
                           },
                       @{
                           @"companyName" : @"中新力和有限公司",
                           @"companyIcon" : @"u312",
                           @"companyCeo" : @"法定代表人\n陈杭生",
                           @"companyMoney" : @"注册资本\n5300万元人民币",
                           @"companyStarTime" : @"注册时间\n2004-11-18",
                           },
                       @{
                           @"companyName" : @"上海巨人网络有限公司",
                           @"companyIcon" : @"u332",
                           @"companyCeo" : @"法定代表人\n刘伟",
                           @"companyMoney" : @"注册资本\n300万元人民币",
                           @"companyStarTime" : @"注册时间\n1990-12-15",
                           },
                       @{
                           @"companyName" : @"珠海格力集团有限公司",
                           @"companyIcon" : @"u368",
                           @"companyCeo" : @"法定代表人\n周乐伟",
                           @"companyMoney" : @"注册资本\n180000万元人民币",
                           @"companyStarTime" : @"注册时间\n2003-06-18",
                           },
                       @{
                           @"companyName" : @"厦门美图网络科技有限公司",
                           @"companyIcon" : @"u370",
                           @"companyCeo" : @"法定代表人\n吴泽源",
                           @"companyMoney" : @"注册资本\n13200万元人民币",
                           @"companyStarTime" : @"注册时间\n2010-03-03",
                           },
                       
                       
                       ];
        _dataAarry = [HGSpecialModel mj_objectArrayWithKeyValuesArray:array];
        
    }
    return _dataAarry;
}


@end
