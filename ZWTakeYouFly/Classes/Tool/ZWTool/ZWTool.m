//
//  ZWTool.m
//  ZWTakeYouFly
//
//  Created by 张三 on 17/10/17.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWTool.h"

@implementation ZWTool

+ (void)MApropertyModelWithDictionary:(NSDictionary *)dict
{
    
    NSMutableString *strM = [NSMutableString string];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *str;
        
        NSLog(@"%@",[obj class]);
        
        if ([NSStringFromClass([obj class]) containsString:@"String"]) {
            str = [NSString stringWithFormat:@"/** ====属性备注===== */\n@property (nonatomic, copy) NSString *%@;",key];
        }
        if ([NSStringFromClass([obj class]) containsString:@"Number"]) {
            str = [NSString stringWithFormat:@"@/** ====属性备注===== */\nproperty (nonatomic, assign) int %@;",key];
        }
        if ([NSStringFromClass([obj class]) containsString:@"Array"]) {
            str = [NSString stringWithFormat:@"/** ====属性备注===== */\n@property (nonatomic, copy) NSArray *%@;",key];
        }
        if ([NSStringFromClass([obj class]) containsString:@"Dictionary"]) {
            str = [NSString stringWithFormat:@"/** ====属性备注===== */\n@property (nonatomic, copy) NSDictionary *%@;",key];
        }
        if ([NSStringFromClass([obj class]) containsString:@"Boolean"]) {
            str = [NSString stringWithFormat:@"/** ====属性备注===== */\n@property (nonatomic, assign) BOOL %@;",key];
        }
        
        [strM appendFormat:@"\n%@\n",str];
    }];
    
    NSLog(@"\n\n\n=======自动生成属性声明的代码=======\n\n\n%@",strM);
}


@end
