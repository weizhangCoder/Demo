//
//  ListCollectionViewCell.h
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/11.
//  Copyright © 2017年 zw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HGSpecialModel.h"
@interface ListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *subLabel_1;
@property (weak, nonatomic) IBOutlet UILabel *subLabel_2;
@property (weak, nonatomic) IBOutlet UILabel *subLabel_3;
@property (nonatomic,strong)HGSpecialModel *model;
@end
