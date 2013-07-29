//
//  UIImage+ImageFile.h
//  CSPopupView
//
//  Created by Mustafin Askar on 29.04.13.
//  Copyright (c) 2013 askar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageFile)

+ (UIImage*)imageWithImageFile:(NSString*)imageName;
+ (UIImage*)imageWithImageFile:(NSString *)imageName extension:(NSString *)extension;

@end
