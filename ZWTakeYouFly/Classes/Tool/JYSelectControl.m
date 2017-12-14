//
//  JYSelectControl.m
//  MposManager
//
//  Created by silence on 2017/11/28.
//  Copyright © 2017年 FW. All rights reserved.
//

#import "JYSelectControl.h"
/** 从RGB转换成UIColor （16进制->10进制）*/
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define JY_WeakSelf __weak __typeof(&*self)weakSelf = self;
//分割线字体颜色
#define KLineColor kUIColorFromRGB(0xdcdcdc)
///白色
#define KWhiteColor_Color kUIColorFromRGB(0xFFFFFF)
///占位符颜色
#define KSubTitle_9_Color kUIColorFromRGB(0x999999)
//登录边框的颜色
#define KBorderColor kUIColorFromRGB(0xffb400)
//默认的字体颜色
#define KSubtitleColor kUIColorFromRGB(0x666666)
//登录边框的颜色
#define KBorderColor kUIColorFromRGB(0xffb400)

@interface JYSelectControl ()

@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UIView  *separateLine;
@property (nonatomic, strong) UIView  *selectLine;
@property (nonatomic, assign) NSInteger currentSelect;

@end

@implementation JYSelectControl

- (id)initWithLeftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.leftLabel];
        [self addSubview:self.rightLabel];
        [self addSubview:self.separateLine];
        [self addSubview:self.selectLine];
        
        JY_WeakSelf
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.mas_left);
            make.top.equalTo(weakSelf.mas_top);
            make.bottom.equalTo(weakSelf.mas_bottom);
            make.right.equalTo(weakSelf.mas_centerX);
        }];
        
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.mas_centerX);
            make.top.equalTo(weakSelf.mas_top);
            make.bottom.equalTo(weakSelf.mas_bottom);
            make.right.equalTo(weakSelf.mas_right);
        }];
        
        [self.separateLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.mas_centerX);
            make.width.mas_equalTo(1);
            make.top.equalTo(weakSelf.mas_top).offset(12);
            make.bottom.equalTo(weakSelf.mas_bottom).offset(-12);
        }];
        
        [self.selectLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.mas_left);
            make.right.equalTo(weakSelf.mas_centerX);
            make.bottom.equalTo(weakSelf.mas_bottom);
            make.height.mas_equalTo(1.0);
        }];
        
        self.leftLabel.text = leftTitle;
        self.rightLabel.text = rightTitle;
        
        _currentSelect = 0;
    }
    return self;
}

- (UILabel *)leftLabel{
    
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _leftLabel.font = [UIFont systemFontOfSize:16];
        _leftLabel.backgroundColor = [UIColor clearColor];
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        _leftLabel.textColor = [UIColor colorTheme];
    }
    return _leftLabel;
}

- (UILabel *)rightLabel{
    
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _rightLabel.font = [UIFont systemFontOfSize:16];;
        _rightLabel.backgroundColor = [UIColor clearColor];
        _rightLabel.textAlignment = NSTextAlignmentCenter;
        _rightLabel.textColor = KSubTitle_9_Color;
    }
    return _rightLabel;
}

- (UIView *)selectLine{
    if (!_selectLine) {
        _selectLine = [[UIView alloc] initWithFrame:CGRectZero];
        _selectLine.backgroundColor = [UIColor colorTheme];
    }
    return _selectLine;
}

- (UIView *)separateLine{
    if (!_separateLine) {
        _separateLine = [[UIView alloc] initWithFrame:CGRectZero];
        _separateLine.backgroundColor = KLineColor;
    }
    return _separateLine;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    CGFloat touchX = point.x;
    CGFloat separX = self.separateLine.right;
    
    NSInteger selectIndex = touchX<separX?0:1;
    if (selectIndex == self.currentSelect) {
        return;
    }
    self.currentSelect = selectIndex;
    
    [self afterSelectChangeUIForIndex:selectIndex];

    if (self.selectBlock) {
        self.selectBlock(selectIndex);
    }
}

- (void)afterSelectChangeUIForIndex:(NSInteger)index{
    
    JY_WeakSelf
    if (index == 0) {
        self.leftLabel.textColor = [UIColor colorTheme];
        self.rightLabel.textColor = KSubTitle_9_Color;
    }else{
        self.leftLabel.textColor = KSubTitle_9_Color;
        self.rightLabel.textColor = [UIColor colorTheme];;
    }
    
    [self.selectLine mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (index == 0) {
            make.left.equalTo(weakSelf.mas_left);
            make.right.equalTo(weakSelf.mas_centerX);
        }else{
            make.left.equalTo(weakSelf.mas_centerX);
            make.right.equalTo(weakSelf.mas_right);
        }
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.height.mas_equalTo(1.0);
    }];
}

@end
