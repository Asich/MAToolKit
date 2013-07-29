//
//  UIColor+RGB.m
//  btaInsurance
//
//  Created by Mustafin Askar on 19.03.13.
//  Copyright (c) 2013 askar. All rights reserved.

//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)

+ (UIColor *)fromRGB:(int)RGBValueInHEX
{
    return [self fromRGB:RGBValueInHEX andAlpha:1.0];
}

+ (UIColor *)fromRGB:(int)RGBValueInHEX andAlpha:(float)alpha
{
    return [UIColor colorWithRed:((float)((RGBValueInHEX & 0xFF0000) >> 16))/255.0 green:((float)((RGBValueInHEX & 0xFF00) >> 8))/255.0 blue:((float)(RGBValueInHEX & 0xFF))/255.0 alpha:alpha];
}

+ (UIImage *)imageFromColor:(UIColor *)color width:(float)width height:(float)height
{
    CGRect rect = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
