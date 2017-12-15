//
//  FirstViewController.m
//  ZWTakeYouFly
//
//  Created by zhangwei on 17/7/24.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "FirstViewController.h"
#import "ZWCoverModel_0_Cell.h"
#import "ZWCoverModel_1_Cell.h"
#import "ZWCoverModel_2_Cell.h"
#import "DataModel.h"
#import "home_headView.h"
#import "HJDropDownMenu.h"

#import "ZWCompanyViewController.h"

#import "CityListViewController.h"


@interface FirstViewController ()<CityListViewDelegate>
@property (nonatomic,strong)NSMutableArray *group;

@end

@implementation FirstViewController

#pragma mark --------------------------LifeCycle----------------------/
- (instancetype)initWithStyle:(UITableViewStyle)style{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithNormalImage:@"加号_白色" target:self action:@selector(login) width:40 height:40];

    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u76"]];
    logo.frame = CGRectMake(0, 0, 165, 29);
//    self.navigationItem.titleView = logo;
    self.title = @"企业信用产品服务平台";
    
//
//    self.tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
//    self.tableView.separatorColor = [UIColor colorFromHex:@"#999999" alpha:0.3];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorBackWithBackView];
       NSLog(@"viewDidLayoutSubviews  %@",NSStringFromCGRect(self.view.frame));
    
    
    home_headView *headView = [[[NSBundle mainBundle] loadNibNamed:@"home_headView" owner:nil options:nil] lastObject];
    headView.backgroundColor = [UIColor colorTheme];
    headView.autoresizingMask = UIViewAutoresizingNone;
    headView.frame = CGRectMake(0, 0, kScreen_Width, 150);
    self.tableView.tableHeaderView = headView;
    [headView setSegmetBlock:^(NSInteger index) {
        NSLog(@"======%ld",index);
        if (index == 0) {
          ZWCompanyViewController *company =  [ZWCompanyViewController new];
          [self pushVc:company];
            
        }else{
            [self pushCity];

        }
    }];
    headView.selectView.userInteractionEnabled = YES;
    
  
  
}

- (void)pushCity{
    CityListViewController *cityListView = [[CityListViewController alloc]init];
    cityListView.delegate = self;
    cityListView.title = @"城市信用";
    //热门城市列表
    cityListView.arrayHotCity = [NSMutableArray arrayWithObjects:@"北京",@"上海",@"天津",@"深圳",@"广州",@"厦门",@"重庆",@"福州",@"泉州",@"济南",@"长沙",@"无锡", nil];
    //历史选择城市列表
    cityListView.arrayHistoricalCity = [NSMutableArray arrayWithObjects:@"北京",@"上海",@"天津", nil];
    //定位城市列表
    cityListView.arrayLocatingCity   = [NSMutableArray arrayWithObjects:@"北京", nil];
    [self.navigationController pushViewController:cityListView animated:YES];
    //    [self presentViewController:cityListView animated:YES completion:nil];
}
- (void)didClickedWithCityName:(NSString*)cityName{
    
}
- (void)login{
    
    
}

#pragma mark --------------------------SetUp----------------------/


#pragma mark --------------------------NetWork----------------------/


#pragma mark --------------------------Event----------------------/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return Kcell_0_H * 2;
    }else if (indexPath.section == 1){
        return KCDCYLH *KWidth_Scale;
    }else if (indexPath.section == 2){
        return 100;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return 40;
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        UILabel *headLabel  = [[UILabel alloc]init];
        headLabel.backgroundColor = [UIColor whiteColor];
        headLabel.text = @"   新闻阅读";
        headLabel.font = [UIFont systemFontOfSize:13];
        return headLabel;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 1;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    ZWList *listModel = self.dataSources[indexPath.row];
    if (indexPath.section == 0) {
        ZWCoverModel_0_Cell *cell = [ZWCoverModel_0_Cell nibCellWithTableView:tableView];
        cell.group = self.group;
        return cell;
        
    }else if (indexPath.section == 1){
        ZWCoverModel_1_Cell *cell = [ZWCoverModel_1_Cell nibCellWithTableView:tableView];
//        cell.gr = listModel;
        return cell;
    }
    ZWCoverModel_2_Cell *cell = [ZWCoverModel_2_Cell nibCellWithTableView:tableView];
//    cell.listModel = listModel;
    return cell;
 
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZWWaitViewController *wait = [ZWWaitViewController new];
    [self pushVc:wait];
    
}

#pragma mark --------------------------Lazy----------------------/
- (NSMutableArray *)group{
    if (_group == nil) {
        _group = [NSMutableArray array];
        for (int i = 0; i < 8; i++) {
            NSArray *nameGroup=[[NSArray alloc] initWithObjects:@"查税号",@"查法人",@"查风险",@"查信用编码",@"查地址",@"查电话",@"查商标",@"更多",nil];
//            NSArray *imageGroup=[[NSArray alloc] initWithObjects:@"u101",@"u113",@"u117",@"u121",@"u125",@"u129",@"u133",@"u137",nil];
            
            DataModel *model = [[DataModel alloc]init];
            model.text = nameGroup[i];
            model.imageName = nameGroup[i];
            [_group addObject:model];
            
        }
    }
    return _group;
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
