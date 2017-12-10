//
//  UIColor+applianceHex.m
//  张云杰
//
//  Created by mac on 16/3/13.
//  Copyright © 2016年 com.jyall. All rights reserved.
//

#import "UIColor+applianceHex.h"

#define     TLColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

@implementation UIColor (applianceHex)
+ (UIColor *)colorFromHex:(NSString *)hex
{
    return [UIColor colorFromHex:hex alpha:1.0];
}

+ (UIColor *)colorFromHex:(NSString *)hex alpha:(CGFloat)alpha
{
    NSString *cleanString = [hex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


#pragma mark - #
+ (UIColor *)colorBackWithBackView{
    return [UIColor colorFromHex:@"#f8f8f8"];
}

+ (UIColor *)colorTheme{
    return [UIColor colorFromHex:@"#20558A"];
}

+ (UIColor *)colorLine{
    return [UIColor colorFromHex:@"#dcdcdc"];
}

+ (UIColor *)colorTextBlack{
    return [UIColor colorFromHex:@"#333333"];
}
+ (UIColor *)colorPlaceholderTextBlack{
    return [UIColor colorFromHex:@"#999999"];
}

@end
