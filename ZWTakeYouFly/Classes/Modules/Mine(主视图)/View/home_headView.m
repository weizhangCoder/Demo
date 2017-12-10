//
//  home_headView.m
//  ZWTakeYouFly
//
//  Created by Zhangwei on 2017/12/10.
//  Copyright © 2017年 zw. All rights reserved.
//

#import "home_headView.h"
@interface home_headView()
@property (weak, nonatomic) IBOutlet UIView *searchView;
@property (nonatomic,strong)UISegmentedControl *segment;
@end

@implementation home_headView

- (void)awakeFromNib{
    [super awakeFromNib];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Click:)];
    [self.searchView addGestureRecognizer:tap];
    self.searchView.userInteractionEnabled = YES;
    _segment.selectedSegmentIndex = 0;
}

- (IBAction)changed:(UISegmentedControl *)sender {
    _segment = sender;
    NSLog(@"------%ld",_segment.selectedSegmentIndex);
    
}

- (void)Click:(UITapGestureRecognizer *)tap{
    
    if (self.segmetBlock) {
        self.segmetBlock(_segment.selectedSegmentIndex);
    }
    
}

@end
