//
//  ZWTestTableViewCell.m
//  ZWTakeYouFly
//
//  Created by 张三 on 15/12/17.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "ZWTestTableViewCell.h"

@implementation ZWTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    
    if (hitView == self) {
        return nil;
    } else {
        return hitView;
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
