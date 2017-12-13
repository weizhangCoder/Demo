//
//  one_CollectionViewCell.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/12.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "one_CollectionViewCell.h"

@implementation one_CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    self.hejiLabel.text = [NSString stringWithFormat:@"合计:%d",[self getRandomNumber:15000 to:8000000]];
    self.yuduLabel.text = [NSString stringWithFormat:@"本月:%d",[self getRandomNumber:5 to:80]];
    self.yearLabel.text = [NSString stringWithFormat:@"本年:%d",[self getRandomNumber:15 to:7000]];
}

-(int)getRandomNumber:(int)from to:(int)to

{
    
    return (int)(from + (arc4random() % (to-from + 1))); //+1,result is [from to]; else is [from, to)!!!!!!!
    
}

@end
