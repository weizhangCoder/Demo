//
//  ZWBaseViewController.m
//  TakeYouFly
//
//  Created by zhangwei on 17/6/15.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWBaseViewController.h"

@interface ZWBaseViewController ()

@end

@implementation ZWBaseViewController

#pragma mark --------------------------LifeCycle----------------------/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorBackWithBackView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        //        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.navigationController.navigationBar.translucent = NO;
    }
//    [NSNotificationCenter addObserver:self action:@selector(requestSuccessNotification) name:kNHRequestSuccessNotification];

}
#pragma mark --------------------------SetUp----------------------/
- (void)requestSuccessNotification {
    [self hideLoadingAnimation];
}


//- (void)dealloc {
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

#pragma mark --------------------------NetWork----------------------/


#pragma mark --------------------------Event----------------------/

#pragma mark --------------------------Lazy----------------------/



@end
