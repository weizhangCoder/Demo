//
//  MMZCViewController.h
//  TKPhoneTextFieldDemo
//
//  Created by pro1 on 17/9/12.
//  Copyright © 2017年 kangshifu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^loginSucceedBlock)();
@interface MMZCViewController : UIViewController
@property (nonatomic, copy) loginSucceedBlock login;
//@property(copy , nonatomic) void(^loginSucceedBlock)() login;
@end
