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

@interface ZWComeyDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *group;
@end

@implementation ZWComeyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
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
            NSArray *imageGroup=[[NSArray alloc] initWithObjects:@"u482",@"u486",@"u490",@"u494",@"u498",@"u502",@"u506",@"u510",nil];
            
            DataModel *model = [[DataModel alloc]init];
            model.text = nameGroup[i];
            model.imageName = imageGroup[i];
            [_group addObject:model];
            
        }
    }
    return _group;
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
