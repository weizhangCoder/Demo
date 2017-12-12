//
//  ZWCompanyViewController.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/10.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWCompanyViewController.h"
#import "MoreDropDownMenu.h"
//#import "ListCollectionViewCell.h"
#import "HGSpecialModel.h"
#import "ZWTableViewCell.h"
#import "ZWComeyDetailViewController.h"



#define HGSpecialName  @"HGSpecialName"
@interface ZWCompanyViewController ()<MoreDropDownMenuDataSource,MoreDropDownMenuDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray               *cates;
@property (nonatomic, strong) NSArray               *states;
@property (nonatomic, strong) NSArray               *sorts;
@property (nonatomic, strong) MoreDropDownMenu       *menu;

@property (nonatomic,strong) NSMutableArray *specialArr;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation ZWCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithNormalImage:@"u382" target:self action:@selector(backHome) width:20 height:20];
    
    [self setup];
    
    [self.view addSubview:self.tableView];

    

    
  
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 35)];//allocate titleView
    UIColor *color = [UIColor whiteColor];
    [titleView setBackgroundColor:color];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
//    searchBar.delegate = self;
    searchBar.placeholder = @"请输入查询内容";
    searchBar.frame = CGRectMake(0, 0, 240, 35);
    searchBar.backgroundColor = color;
    searchBar.layer.cornerRadius = 18;
    searchBar.layer.masksToBounds = YES;
    [titleView addSubview:searchBar];
    ViewRadius(titleView, 10);
    //Set to titleView
    self.navigationItem.titleView = titleView;
    
    NSMutableArray *headImageNames = [[NSMutableArray alloc]initWithObjects:@"u236",@"u272",@"u292",@"u312",@"u332",@"u368",@"u370", nil];
    NSMutableArray *companys = [[NSMutableArray alloc]initWithObjects:@"小米科技有限公司",@"万科企业股份有限公司",@"北京宝亿嵘影业有限公司",@"中新力和有限公司",@"上海巨人网络有限公司",@"珠海格力集团有限公司",@"厦门美图网络科技有限公司", nil];
    NSMutableArray *farenrray = [[NSMutableArray alloc]initWithObjects:@"法定代表人\n雷军",@"法定代表人\n郁亮",@"法定代表人\n任晓妍",@"法定代表人\n陈杭生",@"法定代表人\n刘伟",@"法定代表人\n周乐伟",@"法定代表人\n吴泽源", nil];
    NSMutableArray *moneyArray = [[NSMutableArray alloc]initWithObjects:@"注册资本\n13200万元人民币",@"注册资本\n1099521.0218万元人民币",@"注册资本\n2000万元人民币",@"注册资本\n5300万元人民币",@"注册资本\n300万元人民币",@"注册资本\n180000万元人民币",@"注册资本\n13200万元人民币", nil];
    NSMutableArray *timeArrays = [NSMutableArray arrayWithObjects:@"注册时间\n2010-03-03",@"注册时间\n1984-05-30",@"注册时间\n2010-08-30",@"注册时间\n2004-05-18",@"注册时间\n2004-11-18",@"注册时间\n1990-12-15",@"注册时间\n2003-06-18", nil];

    
    for (int i = 0; i < farenrray.count; i++) {
        HGSpecialModel *model = [[HGSpecialModel alloc]init];
        model.farenName = farenrray[i];
        model.companyName = companys[i];
        model.imageName = headImageNames[i];
        model.moneyName = moneyArray[i];
        model.timeName =  timeArrays[i];
        [self.specialArr addObject:model];
    }
    [_tableView reloadData];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)backHome{
    [self popToRootVc];
}
- (void)setup{
    self.cates = @[@"全国",@"服饰",@"搭配",@"数码",@"餐厨",@"出行",@"文具",@"居家",@"品牌"];
    self.states = @[@"全部行业",@"预售中",@"预售失败",@"成功结束"];
    self.sorts = @[@"更多筛选",@"最新",@"价格"];
    
    _menu = [[MoreDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:49.5];
    _menu.delegate = self;
    _menu.dataSource = self;
    //当下拉菜单收回时的回调，用于网络请求新的数据
    [self.view addSubview:_menu];
    _menu.finishedBlock=^(MoreIndexPath *indexPath){
        if (indexPath.item >= 0) {
            NSLog(@"收起:点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
        }else {
            NSLog(@"收起:点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
        }
    };
    [_menu selectIndexPath:[MoreIndexPath indexPathWithCol:1 row:1]];
}
#pragma mark - MoreDropDownMenuDataSource and MoreDropDownMenuDelegate
- (NSInteger)numberOfColumnsInMenu:(MoreDropDownMenu *)menu{
    return 3;
}

- (NSInteger)menu:(MoreDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column{
    if (column == 0) {
        return self.cates.count;
    }else if (column == 1){
        return self.states.count;
    }else {
        return self.sorts.count;
    }
}

- (NSString *)menu:(MoreDropDownMenu *)menu titleForRowAtIndexPath:(MoreIndexPath *)indexPath{
    if (indexPath.column == 0) {
        return self.cates[indexPath.row];
    } else if (indexPath.column == 1){
        return self.states[indexPath.row];
    } else {
        return self.sorts[indexPath.row];
    }
}
- (NSArray *)menu:(MoreDropDownMenu *)menu arrayForRowAtIndexPath:(MoreIndexPath *)indexPath{
    if (indexPath.column == 0) {
        return self.cates;
    } else if (indexPath.column == 1){
        return self.states;
    } else {
        return self.sorts;
    }
}

- (void)menu:(MoreDropDownMenu *)menu didSelectRowAtIndexPath:(MoreIndexPath *)indexPath{
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}

- (void)didTapMenu:(MoreDropDownMenu *)menu{
    //    if (self.moveScroll) {
    //        self.moveScroll(self.tableView);
    //    }
    
    NSLog(@"点击了菜单");
}
-(NSMutableArray *)specialArr
{
    if(_specialArr==nil) {
        _specialArr=[NSMutableArray array];
    }
    return _specialArr;
}
#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _specialArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    
    
    return 1;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HGSpecialName];
    if (cell == nil) {
        cell = [ZWTableViewCell viewFromXib];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = self.specialArr[indexPath.row];

    return cell;
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZWComeyDetailViewController *detail = [[ZWComeyDetailViewController alloc]init];
    detail.model = self.specialArr[indexPath.row];
    [self pushVc:detail];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *viewFoot = [[UIView alloc]init];
//    viewFoot.backgroundColor = JYControllerBackColor;
    return viewFoot;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    
    return nil;
    
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
   
}
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,50, kScreen_Width, kScreen_Height - 50- kNavigationHeight) style:UITableViewStylePlain];
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.rowHeight = 100;
        _tableView.separatorColor = [UIColor colorLine];
        _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.backgroundColor = [UIColor clearColor];
//        _tableView.tableFooterView.hidden = YES;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

    }
    
    return _tableView;
}

@end
