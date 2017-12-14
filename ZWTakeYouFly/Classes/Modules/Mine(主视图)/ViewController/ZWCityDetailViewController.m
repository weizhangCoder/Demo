//
//  ZWCityViewController.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/10.
//  Copyright © 2017年 zw. All rights reserved.
//
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#import "ZWCityDetailViewController.h"
#import "one_CollectionViewCell.h"
#import "two_CollectionViewCell.h"
#import "three_CollectionViewCell.h"


static NSString * const JYindentify_one = @"one_cityIdentifier";//collection
static NSString * const JYindentify_two = @"two_cityIdentifier";//collection
static NSString * const JYindentify_three = @"three_cityIdentifier";//collection

static NSString * const JYHeaderindentify = @"HeaderView"; //collectionHead


@interface ZWCityDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(strong,nonatomic)UICollectionView *myCollectionV;
@property (nonatomic , strong) UICollectionViewFlowLayout *flow;

@end

@implementation ZWCityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorBackWithBackView];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithNormalImage:@"u382" target:self action:@selector(backHome) width:20 height:20];
    
    [self setup];
    
    [ZWProgressHUD showWaitting];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [ZWProgressHUD hideHUD];
        NSLog(@"%@", [NSThread currentThread]);
    
    });
}


- (void)setup{
    
    if (!_myCollectionV) {
        
        UICollectionViewFlowLayout *flow = [UICollectionViewFlowLayout new];
//        //格子的大小 (长，高)
//        flow.itemSize = CGSizeMake((kScreen_Width /4) ,Kcell_0_H);
//        //横向最小距离
//        flow.minimumInteritemSpacing = 0;
//        //代表的是纵向的空间间隔
//        flow.minimumLineSpacing=0;
//        //设置，上／左／下／右 边距 空间间隔数是多少
//        flow.sectionInset = UIEdgeInsetsMake(0,20,0,20);
        [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        flow.headerReferenceSize = CGSizeMake(kScreen_Width, 40);
        flow.footerReferenceSize = CGSizeMake(0, 0);
        self.flow = flow;
        
        
        _myCollectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height - kNavigationHeight) collectionViewLayout:flow];
        _myCollectionV.backgroundColor = [UIColor clearColor];
//        _myCollectionV.scrollEnabled = NO;
        //设置代理为当前控制器
        _myCollectionV.delegate = self;
        _myCollectionV.dataSource = self;
        _myCollectionV.contentInset = UIEdgeInsetsMake(0,20,0,20);
        
        
        
#pragma mark -- 注册单元格
        
        [_myCollectionV registerNib:[UINib nibWithNibName:NSStringFromClass([one_CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:JYindentify_one];
        [_myCollectionV registerNib:[UINib nibWithNibName:NSStringFromClass([two_CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:JYindentify_two];
        [_myCollectionV registerNib:[UINib nibWithNibName:NSStringFromClass([three_CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:JYindentify_three];
        
        
//        //#pragma mark -- 注册头部视图
        [_myCollectionV registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JYHeaderindentify];
        
        
        //添加视图
        [self.view addSubview:_myCollectionV];
        
        
    }
    
    
}

#pragma mark --UICollectionView dataSource

//每个section有多少个元素
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section != 2) {
        return 6;
    }
    return 1;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//
//    return UIEdgeInsetsMake(0, 20, 0, 20);
//}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake((kScreenWidth - 40 -10)/2, 100);
    }else if (indexPath.section == 1){
        return CGSizeMake((kScreenWidth - 40)/3, 60);
    }
    return CGSizeMake(kScreenWidth - 40, 150);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 0;
}
//每个单元格的数据
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
    one_CollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:JYindentify_one forIndexPath:indexPath];
        NSArray *headarray = [NSArray arrayWithObjects:@"u674",@"u680",@"u686",@"u692",@"u698",@"u704", nil];
        NSArray *textarray = [NSArray arrayWithObjects:@"企业数量",@"良好企业记录",@"不良企业记录",@"被投诉企业",@"立行政表彰企业",@"行政处罚企业", nil];
        cell.headImage.image = [UIImage imageNamed:headarray[indexPath.row]];
        cell.titleNameLabel.text =textarray[indexPath.row];
        return cell;
    }else if (indexPath.section == 1){
        NSArray *array = [NSArray arrayWithObjects:@"城市概况",@"诚信聚焦",@"法律法规",@"市场监管",@"立信企业",@"城市评论", nil];
        two_CollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:JYindentify_two forIndexPath:indexPath];
        NSString *name  = array[indexPath.row];
        [cell.btnName setTitle:name forState:UIControlStateNormal];
//        int y =100 +  (arc4random() % 101);
        NSArray *arrays = [NSArray arrayWithObjects:@"#95918c",@"#324ab2",@"#3bb08f",@"#ff496c",@"#6699cc",@"#fc6c85", nil];
        NSString *color = arrays[indexPath.row];
        cell.btnName.backgroundColor = [UIColor colorFromHex:color];
        ViewRadius(cell.btnName, 5);
        return cell;
    }
    three_CollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:JYindentify_three forIndexPath:indexPath];
    return cell;
    
    
}
//创建头视图
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//           viewForSupplementaryElementOfKind:(NSString *)kind
//                                 atIndexPath:(NSIndexPath *)indexPath {
//    
//    head_CollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
//                                                                            withReuseIdentifier:JYHeaderindentify
//                                                                                   forIndexPath:indexPath];
////    headView.backgroundColor = [UIColor clearColor];
////    UILabel *headLabel = [[UILabel alloc]init];
////    headLabel.frame = CGRectMake(0, 0, kScreen_Width, 30);
////    [headView addSubview:headLabel];
////    
////    if (indexPath.section == 0) {
////        headLabel.text = @"信用名片";
////    }else if (indexPath.section == 1){
////        headLabel.text = @"管理规划";
////    }
////       headLabel.text = @"城市概况";
//    return headView;
//}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    // 如果当前想要的是头部视图
    // UICollectionElementKindSectionHeader是一个const修饰的字符串常量,所以可以直接使用==比较
    if (kind == UICollectionElementKindSectionHeader) {
      
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JYHeaderindentify forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor clearColor];
        UILabel *headLabel = [[UILabel alloc]init];
        headLabel.frame = headerView.bounds;
        [headerView addSubview:headLabel];
            if (indexPath.section == 0) {
                headLabel.text = @"信用名片";
            }else if (indexPath.section == 1){
                headLabel.text = @"管理规划";
            }else{
                headLabel.text = @"城市概况";
            }
        
        return headerView;
    }
    else { // 返回每一组的尾部视图
        UICollectionReusableView *footerView =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:JYHeaderindentify forIndexPath:indexPath];

        footerView.backgroundColor = [UIColor purpleColor];
        return footerView;
    }


}
- (void)backHome{
    [self popToRootVc];
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
