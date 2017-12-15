//
//  ZWComeyDetailViewController.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/11.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWComeyDetailViewController.h"
#import "ZWCoverModel_0_Cell.h"
#import "DataModel.h"

#import "detail_2.h"
#import "detail_0_Cell.h"
#import "CompanyView.h"
#import "topView.h"


@interface ZWComeyDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *group;
@end

@implementation ZWComeyDetailViewController
- (void)backHome{
    [self popToRootVc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [ZWProgressHUD showWaitting];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ZWProgressHUD hideHUD];
        NSLog(@"%@", [NSThread currentThread]);
        
    });
    
    self.title = @"公司详情";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithNormalImage:@"u382" target:self action:@selector(backHome) width:20 height:20];
    
    [self.view addSubview:self.tableView];
    UIView * headView = [[UIView alloc]init];
    headView.frame = CGRectMake(0, 0, kScreenWidth, 250);
    self.tableView.tableHeaderView = headView;
    UIView *bottomView = [[[NSBundle mainBundle] loadNibNamed:@"bottomView" owner:nil options:nil] lastObject];;
    [headView addSubview:bottomView];
    ViewBorder(bottomView, [UIColor colorLine], 0.5);
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView.mas_left);
        make.right.equalTo(headView.mas_right);
        make.bottom.equalTo(headView.mas_bottom);
        make.height.mas_equalTo(40);
    }];
    CompanyView *company = [CompanyView viewFromXib];
    [headView addSubview:company];
    company.ceoLabel.text = self.model.companyCeo;
    company.moneyLabel.text = self.model.companyMoney;
    company.timeLabel.text = self.model.companyStarTime;
    
    [company mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView.mas_left);
        make.right.equalTo(headView.mas_right);
        make.bottom.equalTo(bottomView.mas_top);
        make.height.mas_equalTo(80);
    }];
    topView *top = [topView viewFromXib];
    [headView addSubview:top];
    top.companyImage.image = [UIImage imageNamed:self.model.companyIcon];
    top.companyLabel.text = self.model.companyName;
    [top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(headView);
        make.top.equalTo(headView.mas_top).offset(kNavigationHeight);
        make.bottom.equalTo(company.mas_top);
    }];
    
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, kScreen_Width, kScreen_Height - kNavigationHeight) style:UITableViewStyleGrouped];
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.rowHeight = 100;
        _tableView.separatorColor = [UIColor colorLine];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
        //        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        _tableView.backgroundColor = [UIColor clearColor];
        //        _tableView.tableFooterView.hidden = YES;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0 );
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        
    }
    
    return _tableView;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    
    return 3;
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return 30;
    }else if (section == 0){
        return 10;
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        return Kcell_0_H * 2;
    }else if (indexPath.section == 2){
        return 170;
    }
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *title = [[UILabel alloc]init];
    if (section == 1) {
        title.text = @"  企业信息";
    }else if (section == 2){
        title.text = @"  企业关系";
    }
    return title;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
     detail_0_Cell *cell = [detail_0_Cell nibCellWithTableView:tableView];
        //        cell.group = self.group;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"企业情报动态";
            cell.subTitle.text = @"共有1076条动态";
        }else{
            cell.textLabel.text = self.model.companyName;
            cell.subTitle.text = @"E轮";
        }
        return cell;
        
    }else if (indexPath.section == 1){
        ZWCoverModel_0_Cell *cell = [ZWCoverModel_0_Cell nibCellWithTableView:tableView];;
        cell.group = self.group;
        return cell;
    }
    detail_2 *cell = [detail_2 nibCellWithTableView:tableView];
    //    cell.listModel = listModel;
    return cell;

}

- (NSMutableArray *)group{
    if (_group == nil) {
        _group = [NSMutableArray array];
        for (int i = 0; i < 8; i++) {
            NSArray *nameGroup=[[NSArray alloc] initWithObjects:@"企业名片",@"基本信息",@"信用名片",@"信用档案",@"信用报告",@"企业风险",@"风险提示",@"企业评价",nil];
//            NSArray *imageGroup=[[NSArray alloc] initWithObjects:@"u482",@"u486",@"u490",@"u494",@"u498",@"u502",@"u506",@"u510",nil];
            
            DataModel *model = [[DataModel alloc]init];
            model.text = nameGroup[i];
            model.imageName = nameGroup[i];
            [_group addObject:model];
            
        }
    }
    return _group;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZWWaitViewController *wait = [ZWWaitViewController new];
    [self pushVc:wait];
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
