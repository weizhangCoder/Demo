//
//  UIImageView+Extension.h
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/7/22.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GifAnimalfinishHandle)(BOOL finished);

@interface UIImageView (Extension)



/** 设置图片*/
- (void)zw_setImageWithUrl:(NSString *)url;

/** 设置图片*/
- (void)zw_setImageWithUrl:(NSString *)url placeHolder:(UIImage *)image;

/** 设置图片*/
- (void)zw_setImageWithUrl:(NSString *)url placeHolder:(UIImage *)image progressHandle:(void(^)(CGFloat progress))progressHandle finishHandle:(void(^)(BOOL finished, UIImage *image))finishHandle;






@end
