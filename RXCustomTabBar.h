//
//  RumexCustomTabBar.h
//  
//
//  Created by Oliver Farago on 19/06/2010.
//  Copyright 2010 Rumex IT All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RXCustomTabBarDelegate <UITabBarControllerDelegate>

@required

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end

@interface RXCustomTabBar : UITabBarController 

@property (nonatomic, strong) NSMutableArray *buttons;

@property (nonatomic, assign) id <RXCustomTabBarDelegate> delegate;

- (void)selectTab:(int)tabID;
- (void)unselectAllButtons;

@end