//
//  RumexCustomTabBar.m
//  
//
//  Created by Oliver Farago on 19/06/2010.
//  Copyright 2010 Rumex IT All rights reserved.
//

#import "RXCustomTabBar.h"
#import "ViewController.h"
#import "NBViewController.h"
#import "KaseViewController.h"
#import "Vars.h"
#import "UIColor+RGB.h"
#import "UIImage+ImageFile.h"

#define kBlackColor [UIColor fromRGB:0x272727]

@implementation RXCustomTabBar
{
    int selectedFirst;
    float tabBarHeight, tabBarOriginY, tabBarItemWidth;
    NSMutableArray *tabBarItemsOriginY;
//    IBRMapViewController *v0;
    //UINavigationController *v1, *v2;
    NSArray *views;
    BOOL isLoaded;
    UIImageView* btnImageView;
}

@synthesize buttons;

- (id)init
{
    self = [super init];
    if (self)
    {
        self.view.backgroundColor = [UIColor whiteColor];
        //views = [[NSArray alloc] initWithObjects:<#(id), ...#>, nil]
                
        self.viewControllers = [[NSArray alloc] initWithObjects:
                                [self getViewControllerWithIndex:0],
                                [self getViewControllerWithIndex:1],
                                [self getViewControllerWithIndex:2], nil];
  
        self.buttons = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)v0 //
{
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *vcnavc = [[UINavigationController alloc] initWithRootViewController:vc];
    vcnavc.navigationBar.barStyle = UIBarStyleBlackOpaque;
    vcnavc.navigationBar.hidden = YES;

    vc.view.tag = 0;
    return vcnavc;
}

- (id)v1 //
{
    NBViewController *view1 = [[NBViewController alloc]init];
//    
//    IBRHomeViewController *hvc = [[IBRHomeViewController alloc] init];
//    UINavigationController *view1 = [[UINavigationController alloc] initWithRootViewController:hvc];
//    view1.navigationBar.barStyle = UIBarStyleBlackOpaque;
//    view1.navigationBar.hidden = YES;
    view1.view.tag = 1;
    
    return view1;
}

- (id)v2 // 
{
    KaseViewController *view2 = [[KaseViewController alloc]init];
    view2.view.tag = 2;    
    return view2;
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (!isLoaded)
    {
        isLoaded = YES;

        [self setConstants];
        [self hideTabBar];
        [self setButtons];
        [[self.view.subviews objectAtIndex:0] setFrame:CGRectMake(0, 0, [Vars widthView], [Vars heightView])];
    }
}

- (void)hideTabBar
{
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}

- (void)buttonClicked:(id)sender
{
	int tagNum = [sender tag] - 1;
	[self selectTab:tagNum];
}

- (void)selectTab:(int)tabID
{
    [self unselectAllButtons];
    [[buttons objectAtIndex:(NSUInteger) tabID] setSelected:YES];
    
    [self.delegate tabBarController:self didSelectViewController:[self.viewControllers objectAtIndex:(NSUInteger) tabID]];
    
    if (1 == tabID) // при нажатии на главную ломаем все ранее открытые окна и переходим на главную
    {
        //self.selectedViewController = [self.viewControllers objectAtIndex:1];
        //[self.delegate tabBarController:self didSelectViewController:[self.viewControllers objectAtIndex:tabID]];
    }
    if (self.selectedIndex == tabID) // Клик по уже открытому табу
    {
        //[self.delegate tabBarController:self didSelectViewController:[self.viewControllers objectAtIndex:tabID]];
    }
    else // Клик по неактивному табу
    {
        self.selectedViewController = [self.viewControllers objectAtIndex:(NSUInteger) tabID];
    }
}

- (id)getViewControllerWithIndex:(int)index
{
    switch (index) {
        case 0:
            return [self v0];
            break;
        
        case 1:
            return [self v1];
            break;
            
        case 2:
            return [self v2];
            break;
            
        default:
            return [self v1];
            break;
    }
}

- (void)unselectAllButtons
{
    for (id btn in self.buttons)
    {
        [btn setSelected:NO];
    }
}

#pragma mark - Setting methods

- (void)setConstants
{
    selectedFirst = 0;
    tabBarHeight = [Vars heightOfTabbar];
    tabBarOriginY = [Vars heightView] - tabBarHeight;
    
    int count = [self.viewControllers count];
    
    float tabBarItemWidthReal = 320 / (float)count;
    tabBarItemWidth = (float) floor(320 / (float)count);
    tabBarItemsOriginY = [NSMutableArray array];
    
    float iOffsetX = ([Vars widthView] - 320.0) / 2;
    
    for (int i = 0; i < count; i++)
    {
        float offsetY = (float) (ceil(tabBarItemWidthReal * (float)i) + iOffsetX);
        [tabBarItemsOriginY addObject:[NSNumber numberWithFloat:offsetY]];
    }
}

- (void)setButtons
{
    UIImageView *bgTabBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, [Vars heightView] - [Vars heightOfTabbar] + [Vars heightOfStatusBar], [Vars widthView], [Vars heightOfTabbar])];
    
    bgTabBar.image = [UIColor imageFromColor:kBlackColor width:[Vars widthView] height:[Vars heightOfTabbar]];
    [self.view addSubview:bgTabBar];

    
    for (int i = 0; i < [self.viewControllers count]; i++)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *btnImage = [UIImage imageWithImageFile:[NSString stringWithFormat:@"tabBarItem_%i", i]];
        btn.frame = CGRectMake([[tabBarItemsOriginY objectAtIndex:i] floatValue], tabBarOriginY + [Vars heightOfStatusBar], tabBarItemWidth, tabBarHeight);
        UIView *imgForSelectedState = [[UIView alloc] initWithFrame:btn.frame];
        [imgForSelectedState setBackgroundColor:[UIColor fromRGB:0x027272 andAlpha:1]];
        [btn setBackgroundImage:[Vars imageWithView:imgForSelectedState] forState:UIControlStateSelected];
        [btn setImage:btnImage forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setContentMode:UIViewContentModeCenter];
        [btn setTag:i + 1];
        btn.selected = NO;

        if (i == selectedFirst)
        {
            [btn setSelected:YES];
            self.selectedIndex = (NSUInteger) i;
        }
        
        [self.buttons addObject:btn];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

@end