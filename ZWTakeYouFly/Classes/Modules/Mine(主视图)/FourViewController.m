//
//  FourViewController.m
//  ZWTakeYouFly
//
//  Created by zhangwei on 17/7/24.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "FourViewController.h"

#import "me_headView.h"


@interface FourViewController ()

@end

@implementation FourViewController

//- (void)pushWait{
//    ZWWaitViewController *wait = [ZWWaitViewController new];
//    [self pushVc:wait];
//}
#pragma mark --------------------------LifeCycle----------------------/
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor grayColor];
////    [UIColor wr_setDefaultNavBarTintColor:[UIColor blackColor]];
////    // 设置导航栏标题默认颜色
////    [UIColor wr_setDefaultNavBarTitleColor:[UIColor blackColor]];
////     [self wr_setNavBarBackgroundAlpha:0.2];
//     [self wr_setNavBarBackgroundAlpha:0];
    __weak __typeof(&*self)weakSelf = self;
//    HSHeaderCellModel *header = [[HSHeaderCellModel alloc] initWithCellIdentifier:@"HSHeaderTableViewCell" actionBlock:^(HSBaseCellModel *model) {
//        HSHeaderCellModel *hederModel = (HSHeaderCellModel *)model;
//        hederModel.text = @"奔跑吧,兄弟";
//        [weakSelf updateCellModel:hederModel];
//    }];
//    header.text = @"天霸动霸tuo";
//    header.cellHeight = 100;
    me_headView *headView = [[[NSBundle mainBundle] loadNibNamed:@"me_headView" owner:nil options:nil] lastObject];
    headView.backgroundColor = [UIColor clearColor];
    headView.autoresizingMask = UIViewAutoresizingNone;
    headView.frame = CGRectMake(0, 0, kScreen_Width, 250);
    self.hs_tableView.tableHeaderView = headView;
    self.hs_tableView.backgroundColor = [UIColor colorBackWithBackView];
//    [headView.ClickBtn addTarget:self action:@selector(pushWait) forControlEvents:UIControlEventTouchUpInside];
//    headView.userInteractionEnabled = YES;
   
    
    HSTitleCellModel *guanzhu = [[HSTitleCellModel alloc] initWithTitle:@"我的关注" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击相册")
    }];
    guanzhu.icon = [UIImage imageNamed:@"u810"];
    
    HSTitleCellModel *fujin = [[HSTitleCellModel alloc] initWithTitle:@"附近公司" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击相册")
    }];
    fujin.icon = [UIImage imageNamed:@"meu550"];
    
    HSTitleCellModel *photo = [[HSTitleCellModel alloc] initWithTitle:@"分享好友" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击相册")
    }];
    photo.icon = [UIImage imageNamed:@"u826"];
    
    HSTitleCellModel *favorite = [[HSTitleCellModel alloc] initWithTitle:@"我的评价" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击收藏")
    }];
    favorite.icon = [UIImage imageNamed:@"u834"];
    
    
    HSTitleCellModel *wallet = [[HSTitleCellModel alloc] initWithTitle:@"意见反馈" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击钱包")
    }];
    wallet.icon = [UIImage imageNamed:@"u842"];
    
    
    HSTitleCellModel *expression = [[HSTitleCellModel alloc] initWithTitle:@"联系我们" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击表情")
    }];
    expression.icon = [UIImage imageNamed:@"u850"];
    
    HSTitleCellModel *setting = [[HSTitleCellModel alloc] initWithTitle:@"设置" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击设置")
    }];
    setting.icon = [UIImage imageNamed:@"u858"];
//    NSMutableArray *section = [NSMutableArray arrayWithObjects:header,nil];
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:guanzhu,fujin,photo,favorite,wallet,expression,setting, nil];
//    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:expression,nil];
//    NSMutableArray *section2 = [NSMutableArray arrayWithObjects:setting,nil];
    
//    [self.hs_dataArry addObject:section];
    [self.hs_dataArry addObject:section0];
//    [self.hs_dataArry addObject:section1];
//    [self.hs_dataArry addObject:section2];
    
    
    [self.hs_tableView reloadData];

    
}
#pragma mark --------------------------SetUp----------------------/


#pragma mark --------------------------NetWork----------------------/


#pragma mark --------------------------Event----------------------/
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZWWaitViewController *wait = [ZWWaitViewController new];
    [self pushVc:wait];
    
}
#pragma mark --------------------------Lazy----------------------/

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
