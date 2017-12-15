//
//  JYJumpTool.h
//  ShouBa
//
//  Created by FW on 2017/10/11.
//  Copyright © 2017年 silence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYJumpTool : NSObject

+ (UIViewController *)currentViewController;

+ (void)pushViewController:(UIViewController *)vc animated:(BOOL)animated;

+ (void)presentViewController:(UIViewController *)vc animated:(BOOL)animated completion:(void(^)())completion;
@end
