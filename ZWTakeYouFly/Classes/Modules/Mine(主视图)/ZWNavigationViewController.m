//
//  ZWNavigationViewController.m
//  TakeYouFly
//
//  Created by zhangwei on 17/6/21.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWNavigationViewController.h"

@interface ZWNavigationViewController ()

@end

@implementation ZWNavigationViewController

/**
 *  当第一次使用这个类的时候调用1次
 */
+ (void)initialize
{
    // 设置UINavigationBarTheme的主
    [self setupNavigationBarTheme];
    
    // 设置UIBarButtonItem的主题
//    [self setupBarButtonItemTheme];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}

/**
 *  设置UINavigationBarTheme的主题
 */
+ (void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = [UIFont fontTitle_18];
    //46 85 134
//    [appearance setBarTintColor:[UIColor colorTheme]];
    
    [appearance setBackgroundImage:[UIImage imageFromContextWithColor:[UIColor colorTheme]] forBarMetrics:UIBarMetricsDefault];
    appearance.shadowImage = [UIImage imageFromContextWithColor:[UIColor clearColor]];
    // UIOffsetZero是结构体, 只要包装成NSValue对象, 才能放进字典\数组中
    [appearance setTitleTextAttributes:textAttrs];
 
    
    
}

///**
// *  设置UIBarButtonItem的主题
// */
//+ (void)setupBarButtonItemTheme
//{
//    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
//    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
//
//    /**设置文字属性**/
//    // 设置普通状态的文字属性
//    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateNormal];
//    
//    
//    // 设置高亮状态的文字属性
//    //    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:SWCommonColor, NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateHighlighted];
//    
//    // 设置不可用状态(disable)的文字属性
//    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor grayColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateDisabled];
//    /**设置背景**/
//    // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
//    //    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    //渐变
//   
//}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    // 判断是否为栈底控制器
    if (self.viewControllers.count >0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        //设置导航子控制器按钮的加载样式
        UINavigationItem *vcBtnItem= [viewController navigationItem];
        
        vcBtnItem.leftBarButtonItem = [UIBarButtonItem initWithNormalImage:@"back_button" target:self isLeftButton:YES action:@selector(back)];
        
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}



- (void)back
{
    [self.view endEditing:YES];
    [self popViewControllerAnimated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
