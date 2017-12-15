//
//  ZWTableViewCell.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/11.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWTableViewCell.h"
@interface ZWTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *ceoLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ZWTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(HGSpecialModel *)model{
    _model = model;
    self.companyName.text = model.companyName;
    self.headImage.image = [UIImage imageNamed:model.companyIcon];
    self.ceoLabel.text = model.companyCeo;
    self.moneyLabel.text = model.companyMoney;
    self.timeLabel.text = model.companyStarTime;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
