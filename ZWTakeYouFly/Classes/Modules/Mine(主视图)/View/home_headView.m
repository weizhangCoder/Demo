//
//  home_headView.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/10.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "home_headView.h"
#import "HJDropDownMenu.h"
#import "HGSpecialModel.h"
#import "ZWDataManager.h"
#import "ZWComeyDetailViewController.h"
@interface home_headView()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (nonatomic,strong)UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (nonatomic,strong)HJDropDownMenu * peomMenu;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;

@end

@implementation home_headView
- (IBAction)clickCompanyDetail:(UIButton *)sender {
    
    
    ZWComeyDetailViewController *datil =[ZWComeyDetailViewController new];
    datil.model = [ZWDataManager sharedZWDataManager].dataAarry[sender.tag - 1];
    [[JYJumpTool currentViewController] pushVc:datil];
}

- (void)awakeFromNib{
    [super awakeFromNib];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Click:)];
//    [self.searchView addGestureRecognizer:tap];
//    self.searchView.userInteractionEnabled = YES;
    _segment.selectedSegmentIndex = 0;
    self.selectView.backgroundColor = [UIColor clearColor];
     HGSpecialModel *model = [ZWDataManager sharedZWDataManager].dataAarry[0] ;
    [self.oneBtn setTitle:@"小米" forState:UIControlStateNormal];
    self.oneBtn.tag = 1;
    self.twoBtn.tag = 2;
    self.threeBtn.tag = 3;
    
    HGSpecialModel *model_1 = [ZWDataManager sharedZWDataManager].dataAarry[1] ;
    [self.twoBtn setTitle:@"万科" forState:UIControlStateNormal];
    HGSpecialModel *model_2 = [ZWDataManager sharedZWDataManager].dataAarry[2] ;
    [self.threeBtn setTitle:@"宝亿嵘" forState:UIControlStateNormal];
    
    HJDropDownMenu * peomMenu = [[HJDropDownMenu alloc] initWithFrame:CGRectMake(0, 0, 90, 30)];
    peomMenu.userInteractionEnabled = YES;
    peomMenu.rowHeight = 30;
    peomMenu.datas = @[@"企业名称",@"法定代表人",@"注册地址",@"历史曾用名",@"主要产品"];
    [self.selectView addSubview:peomMenu];
    self.peomMenu = peomMenu;
    
    self.textFiled.delegate = self;
    self.textFiled.returnKeyType = UIReturnKeySearch;

    
}

- (IBAction)changed:(UISegmentedControl *)sender {
    _segment = sender;
    NSLog(@"------%ld",_segment.selectedSegmentIndex);
    if (_segment.selectedSegmentIndex == 0) {
         self.peomMenu.datas = @[@"企业名称",@"法定代表人",@"注册地址",@"历史曾用名",@"主要产品"];
    }else{
        self.peomMenu.datas = @[@"城市名称",@"知名人物",@"物产",@"景点",@"典型事件"];
    }
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self endEditing:YES];
    if (self.segmetBlock) {
        self.segmetBlock(_segment.selectedSegmentIndex);
    }
    return YES;
}

- (void)Click:(UITapGestureRecognizer *)tap{
    
 
    
}

@end
