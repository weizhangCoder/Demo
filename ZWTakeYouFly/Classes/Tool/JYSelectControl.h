//
//  JYSelectControl.h
//  MposManager
//
//  Created by silence on 2017/11/28.
//  Copyright © 2017年 FW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYSelectControl : UIView

/**
 选择回调
 */
@property (nonatomic, copy) void(^selectBlock)(NSInteger index);

/**
 初始化分段选择视图

 @param leftTitle 左边标题
 @param rightTitle 右边标题
 @return JYSelectControl 对象
 */
- (id)initWithLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;

@end
