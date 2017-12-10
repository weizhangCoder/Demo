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
@interface FirstViewController ()
@property (nonatomic,strong)NSMutableArray *group;
@end

@implementation FirstViewController

#pragma mark --------------------------LifeCycle----------------------/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithNormalImage:@"加号_白色" target:self action:@selector(login) width:40 height:40];

    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"u76"]];
    logo.frame = CGRectMake(0, 0, 165, 29);
    self.navigationItem.titleView = logo;
//
//    self.tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
//    self.tableView.separatorColor = [UIColor colorFromHex:@"#999999" alpha:0.3];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorBackWithBackView];
       NSLog(@"viewDidLayoutSubviews  %@",NSStringFromCGRect(self.view.frame));
    
}

- (void)login{
    
    
}

#pragma mark --------------------------SetUp----------------------/


#pragma mark --------------------------NetWork----------------------/


#pragma mark --------------------------Event----------------------/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        return KCDCYLH * 2;
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
//        cell.group = self.group;
        return cell;
        
    }else if (indexPath.section == 1){
        ZWCoverModel_1_Cell *cell = [ZWCoverModel_1_Cell nibCellWithTableView:tableView];
//        cell.listModel = listModel;
        return cell;
    }
    ZWCoverModel_2_Cell *cell = [ZWCoverModel_2_Cell nibCellWithTableView:tableView];
//    cell.listModel = listModel;
    return cell;
 
    
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
