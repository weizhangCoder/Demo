//
//  ZWDataManager.h
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/15.
//  Copyright © 2017年 zw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZWDataManager : NSObject
JYSingletonH(ZWDataManager)

@property (nonatomic,strong)NSArray *dataAarry;
@end
