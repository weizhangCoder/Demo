//
//  ZWCoverModel_1_Cell.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/10.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWCoverModel_1_Cell.h"
#import "SDCycleScrollView.h"

@interface ZWCoverModel_1_Cell()<SDCycleScrollViewDelegate>
@property (nonatomic,strong)NSMutableArray *imageArray;
@property (nonatomic , strong) SDCycleScrollView * cycleScrollView;
@end
@implementation ZWCoverModel_1_Cell
- (NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.contentView addSubview:self.cycleScrollView];
    [self.imageArray addObject:@"u141"];
    [self.imageArray addObject:@"u746"];
    self.cycleScrollView.imageURLStringsGroup = self.imageArray;
}

- (SDCycleScrollView *)cycleScrollView{
    if (_cycleScrollView == nil) {
       _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreen_Width, KCDCYLH *KWidth_Scale) delegate:self placeholderImage:nil];
        _cycleScrollView.delegate = self;
        
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.hidesForSinglePage = YES;
        _cycleScrollView.pageDotColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2];
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor];
        
        
        
    }
    return _cycleScrollView;
}

#pragma mark - 轮播图的代理
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
    ZWWaitViewController *wait = [ZWWaitViewController new];
    [JYJumpTool pushViewController:wait animated:YES];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
