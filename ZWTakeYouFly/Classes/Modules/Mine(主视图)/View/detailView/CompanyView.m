//
//  CompanyView.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/12.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "CompanyView.h"

@implementation CompanyView

- (instancetype)initWithCoder:(NSCoder *)aDecoder

{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        UIView *containerView = [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil] firstObject ];
        
        containerView.frame = self.bounds;
        
        [self addSubview:containerView];
        
    }
    
    return self;
    
}


- (void)awakeFromNib{
    
}

@end
