//
//  Vars.h
//
//
//  Created by Mutafin Askar on 25.02.13.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vars : NSObject

+ (float)heightOfNavbar;
+ (float)widthView;
+ (float)heightView;
+ (float)heightOfTabbar;
+ (float)getOffsetXFromBoxWidth:(float)boxWidth andObjectWidth:(float)objectWidth;
+ (float)getOffsetYFromBoxHeight:(float)boxHeight andObjectHeight:(float)objectHeight;
+ (float)heightOfStatusBar;
+ (UIImage *) imageWithView:(UIView *)view;

@end
