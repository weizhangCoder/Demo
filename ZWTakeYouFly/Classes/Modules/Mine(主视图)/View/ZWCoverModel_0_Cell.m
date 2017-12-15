//
//  ZWCoverModel_0_Cell.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/10.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWCoverModel_0_Cell.h"
#import "CollectionViewCell.h"

static NSString * const JYindentify = @"JZCollectionViewIdentifier";//collection

//static NSString * const JYHeaderindentify = @"HeaderView"; //collectionHead

@interface ZWCoverModel_0_Cell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(strong,nonatomic)UICollectionView *myCollectionV;
@property (nonatomic , strong) UICollectionViewFlowLayout *flow;


@property (nonatomic,strong)NSMutableArray *nameGroup;
@property (nonatomic,strong)NSMutableArray *imageGroup;

@end
@implementation ZWCoverModel_0_Cell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    

    [self setup];
    
    
//    [self.myCollectionV reloadData];
}




- (void)setup{
    
    if (!_myCollectionV) {
        
        UICollectionViewFlowLayout *flow = [UICollectionViewFlowLayout new];
        //格子的大小 (长，高)
        flow.itemSize = CGSizeMake((kScreen_Width /4) ,Kcell_0_H);
        //横向最小距离
        flow.minimumInteritemSpacing = 0;
        //代表的是纵向的空间间隔
        flow.minimumLineSpacing=0;
        //设置，上／左／下／右 边距 空间间隔数是多少
        flow.sectionInset = UIEdgeInsetsMake(0,0,0,0);
        [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
        
//        flow.headerReferenceSize = CGSizeMake(kScreen_Width, kHomeCellHeadH * KWidth_Scale);
        flow.footerReferenceSize = CGSizeMake(0, 0);
        self.flow = flow;
        
        
        _myCollectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, Kcell_0_H * 2) collectionViewLayout:flow];
        _myCollectionV.backgroundColor = [UIColor whiteColor];
        _myCollectionV.scrollEnabled = NO;
        //设置代理为当前控制器
        _myCollectionV.delegate = self;
        _myCollectionV.dataSource = self;
        
        
        
#pragma mark -- 注册单元格
        
        [_myCollectionV registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:JYindentify];
        
        
//#pragma mark -- 注册头部视图
//        [_myCollectionV registerClass:[JYCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:JYHeaderindentify];
        
        
        //添加视图
        [self.contentView addSubview:_myCollectionV];
        
        
    }
    
    
}

#pragma mark --UICollectionView dataSource

//每个section有多少个元素
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.group.count;
}
//每个单元格的数据
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:JYindentify forIndexPath:indexPath];
    
    cell.model = self.group[indexPath.row];
    
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZWWaitViewController *wait = [ZWWaitViewController new];
    [JYJumpTool pushViewController:wait animated:YES];
}

@end
