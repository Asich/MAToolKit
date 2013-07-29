//
//  UIColor+RGB.h
//  btaInsurance
//
//  Created by Mustafin Askar on 19.03.13.
//  Copyright (c) 2013 askar. All rights reserved.

//

#import <UIKit/UIKit.h>

@interface UIColor (RGB)

+ (UIColor *)fromRGB:(int)RGBValueInHEX;
+ (UIColor *)fromRGB:(int)RGBValueInHEX andAlpha:(float)alpha;
+ (UIImage *)imageFromColor:(UIColor *)color width:(float)width height:(float)height;

@end
