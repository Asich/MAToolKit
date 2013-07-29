//
//  Vars.m
//
//
//  Created by Mutafin Askar on 25.02.13.
//  Copyright (c) 2013. All rights reserved.
//

#import "Vars.h"
#import <QuartzCore/QuartzCore.h>

@implementation Vars

/*
 * This method and returns height of screen
 */
+ (float)heightOfNavbar
{
    return 50.0f;
}

/*
 * This method and returns width of screen
 */
+ (float)widthView
{
    return UIScreen.mainScreen.bounds.size.width;
}

/*
 * This method and returns height of whole screen except for statusbar
 */
+ (float)heightView
{
    return UIScreen.mainScreen.bounds.size.height - [self heightOfStatusBar];
}

/*
 * This method and returns height of tabbar
 */
+ (float)heightOfTabbar{
    return 60.0f;
}

/*
 * This method and returns height of status bar
 */
+ (float)heightOfStatusBar{
    return 20.0f;
}

/*
 * This method calculates and returns
 * indentation of the inner object in the outer object, by width
 */
+ (float)getOffsetXFromBoxWidth:(float)boxWidth andObjectWidth:(float)objectWidth
{
    return (boxWidth - objectWidth) / 2;
}

/*
 * This method calculates and returns 
 * indentation of the inner object in the outer object, by heights
 */
+ (float)getOffsetYFromBoxHeight:(float)boxHeight andObjectHeight:(float)objectHeight
{
    return (boxHeight - objectHeight) / 2;
}

/*
 * from UIView to uiimage
 */

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];

    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return img;
}

@end
