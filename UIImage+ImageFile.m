//
//  UIImage+ImageFile.m
//  CSPopupView
//
//  Created by Mustafin Askar on 29.04.13.
//  Copyright (c) 2013 askar. All rights reserved.
//

#import "UIImage+ImageFile.h"

@implementation UIImage (ImageFile)

+ (UIImage*)imageWithImageFile:(NSString*)imageName{
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]
                                      pathForResource:imageName
                                               ofType:@"png"]];
    return image;
}

+ (UIImage*)imageWithImageFile:(NSString *)imageName extension:(NSString *)extension{
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]
                                                       pathForResource:imageName
                                                       ofType:extension]];
    return image;
}

@end