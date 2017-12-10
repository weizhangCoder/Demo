//
//  UIImageView+Extension.m
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/7/22.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "UIImageView+Extension.h"
#import <ImageIO/ImageIO.h>


@interface UIImageView ()<CAAnimationDelegate>

@end


@implementation UIImageView (Extension)

- (void)zw_setImageWithUrl:(NSString *)url{
    
    UIImage *placeholder = [UIImage imageNamed:@""];
    if (url.length == 0) {
        self.image = placeholder;
    };

    [self zw_setImageWithUrl:url placeHolder:placeholder];


}


- (void)zw_setImageWithUrl:(NSString *)url placeHolder:(UIImage *)image{
    

    self.clipsToBounds = YES;
    [self zw_setImageWithUrl:url placeHolder:image progressHandle:nil finishHandle:nil];

}

- (void)zw_setImageWithUrl:(NSString *)url placeHolder:(UIImage *)image progressHandle:(void(^)(CGFloat progress))progressHandle finishHandle:(void(^)(BOOL finished, UIImage *image))finishHandle{
    
    if (!image){
      image = [UIImage imageNamed:@"jyallDeafual"];
    }
    
    self.contentMode = UIViewContentModeScaleAspectFit;

    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:image options:SDWebImageLowPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        if (progressHandle) {
            progressHandle(receivedSize * 1.0 / expectedSize);
        }
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (finishHandle) {
            finishHandle(error == nil, image);
        }
    }];
    

}





@end
