

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)imageWithBorderW:(CGFloat)borderW color:(UIColor *)color CircleImageName:(NSString *)imageName
{
    UIImage *img = [UIImage imageNamed:imageName];
    CGFloat w = img.size.width + 2 * borderW;
    CGFloat h = img.size.height + 2 * borderW;
    CGRect bigCricleRect = CGRectMake(0, 0, w, h);
    
    // 1.开启位图上下文
    UIGraphicsBeginImageContextWithOptions(bigCricleRect.size, NO, 0);
    
    // 2.拼接路径
    // 2.1绘制大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:bigCricleRect];
    // 设置圆环颜色
    [color set];
    
    [path fill];
    
    // 2.2设置裁剪区域
    CGRect clipRect = CGRectMake(borderW, borderW, img.size.width, img.size.height);
    // 描述裁剪区域路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipRect];
    
    [clipPath addClip];
    
    // 绘制图片
    [img drawAtPoint:CGPointMake(borderW, borderW)];
    
    // 获取图片
    img = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return img;

}

- (UIImage *)drawCircleImage {
    
//    UIImage *img = [UIImage imageNamed:imageName];
//    CGFloat w = img.size.width + 2 * borderW;
//    CGFloat h = img.size.height + 2 * borderW;
//    CGRect bigCricleRect = CGRectMake(0, 0, w, h);
    CGRect rect  = CGRectMake(0, 0, 50, 50);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:50] addClip];
    [self drawInRect:rect];
    
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return output;
}


+ (UIImage *)resizableImageWithName:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    // 获取原有图片的宽高的一半
    CGFloat w = image.size.width * 0.5;
    CGFloat h = image.size.height * 0.5;
    
    // 生成可以拉伸指定位置的图片
    UIImage *newImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w) resizingMode:UIImageResizingModeStretch];
    
    return newImage;
}



/**
 *  争对ios7以上的系统适配新的图片资源
 *
 *  @param imageName 图片名称
 *
 *  @return 新的图片
 */
+ (UIImage *)imageWithName:(NSString *)imageName
{
    UIImage *newImage = nil;
    
    if (newImage == nil) {
        newImage = [UIImage imageNamed:imageName];
    }
    return newImage;
    
}


/**
 *  实现图片的缩小或者放大
 *
 *  @param image 原图
 *  @param size  大小范围
 *
 *  @return 新的图片
 */

-(UIImage*) scaleImageWithSize:(CGSize)size
{
    
    UIGraphicsBeginImageContextWithOptions(size,NO,0);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}
- (UIImage*) scaleImageWithFrame:(CGRect)frame{
    
    UIGraphicsBeginImageContextWithOptions(frame.size,NO,0);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [self drawInRect:frame];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片

}
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize

{
    
    UIImage *newimage;
    
    if (nil == image)
        
    {
        
        newimage = nil;
        
    } else {
        
        CGSize oldsize = image.size;
        
        CGRect rect;
        
        if (asize.width/asize.height > oldsize.width/oldsize.height)
            
        {
            
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            
            rect.size.height = asize.height;
            
            rect.origin.x = (asize.width - rect.size.width)/2;
            
            rect.origin.y = 0;
            
        } else {
            
            rect.size.width = asize.width;
            
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            
            rect.origin.x = 0;
            
            rect.origin.y = (asize.height - rect.size.height)/2;
            
        }
        
        UIGraphicsBeginImageContext(asize);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        
        [image drawInRect:rect];
        
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    return newimage;
    
}

//给我一种颜色，一个尺寸，我给你返回一个UIImage
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size{
    
    CGRect rect=(CGRect){{0.0f,0.0f},size};
    
    //开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    
    //获取图形上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    //获取图像
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+(UIImage *)imageFromContextWithColor:(UIColor *)color{
    
    CGSize size=CGSizeMake(1.0f, 1.0f);
    
    return [self imageFromContextWithColor:color size:size];
}

@end
