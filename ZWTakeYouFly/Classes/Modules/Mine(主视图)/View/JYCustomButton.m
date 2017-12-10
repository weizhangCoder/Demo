//
//  RGMeButton.m
//  RiceGod
//
//  Created by rtzl on 15/5/25.
//  Copyright (c) 2015年 ZT. All rights reserved.
//

#import "JYCustomButton.h"

#define kImageScale 0.6

@implementation JYCustomButton

#pragma mark init方法内部默认会调用initWithFrame:
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 里面的图片居中
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        // 里面的文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文字字体
 
        self.titleLabel.font = [UIFont systemFontOfSize:14];
//        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    }
    return self;
}
- (void)awakeFromNib{
  [super awakeFromNib];
        // 里面的图片居中
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        // 里面的文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文字字体
    
}

#pragma mark 当按钮达到高亮状态的时候会调用，并且默认会在这个方法中进行高亮处理
- (void)setHighlighted:(BOOL)highlighted { }

#pragma mark 设置内部imageView的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
//    CGSize imageSize =  self.currentImage.size;
    CGFloat imgW = contentRect.size.width;
    CGFloat imgH = contentRect.size.height *kImageScale;
    return CGRectMake(0, 20, imgW, imgH - 20);
}

#pragma mark 设置内部titleLabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = contentRect.size.width;
    CGFloat titleY = contentRect.size.height * kImageScale;
    CGFloat titleH = contentRect.size.height - titleY;
    
    return CGRectMake(0, titleY, titleW, titleH);
}


@end
