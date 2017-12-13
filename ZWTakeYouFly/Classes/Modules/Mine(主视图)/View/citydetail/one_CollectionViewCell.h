//
//  one_CollectionViewCell.h
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/12.
//  Copyright © 2017年 zw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface one_CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *titleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *hejiLabel;
@property (weak, nonatomic) IBOutlet UILabel *yuduLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;

@end
