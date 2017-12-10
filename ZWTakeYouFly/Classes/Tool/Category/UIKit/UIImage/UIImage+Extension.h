

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  圆形剪裁图片
 *
 *  @param borderW   圆环宽度
 *  @param color     圆环颜色
 *  @param imageName 图片名称
 *
 *  @return 剪裁好的图片
 */
+ (UIImage *)imageWithBorderW:(CGFloat)borderW color:(UIColor *)color CircleImageName:(NSString *)imageName;



+ (UIImage *)resizableImageWithName:(NSString *)imageName;


+ (UIImage *) imageWithName:(NSString *) imageName;/**
                                                    *  争对ios7以上的系统适配新的图片资源
                                                    *
                                                    *  @param imageName 图片名称
                                                    *
                                                    *  @return 新的图片
                                                    */


- (UIImage*) scaleImageWithSize:(CGSize)size;

- (UIImage*) scaleImageWithFrame:(CGRect)frame;



+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;


//给我一种颜色，一个尺寸，我给你返回一个UIImage:不透明
+(UIImage *)imageFromContextWithColor:(UIColor *)color;
+(UIImage *)imageFromContextWithColor:(UIColor *)color size:(CGSize)size;

@end
