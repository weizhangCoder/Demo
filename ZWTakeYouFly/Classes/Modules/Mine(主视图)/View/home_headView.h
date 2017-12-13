//
//  home_headView.h
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/10.
//  Copyright © 2017年 zw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface home_headView : UIView

@property (weak, nonatomic) IBOutlet UIView *selectView;
@property (nonatomic,copy)void(^segmetBlock)(NSInteger index);

@end
