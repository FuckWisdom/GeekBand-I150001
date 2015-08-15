//
//  IWTabBarViewController.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWTabBarViewController.h"
#import "IWTabBar.h"
#import "GBMSquareViewController.h"
#import "GBMMyViewController.h"
#import "UIColor+AddColor.h"
#define VCFromSB(SB,ID) [[UIStoryboard storyboardWithName:SB bundle:nil] instantiateViewControllerWithIdentifier:ID]
#import "GBMLoginViewController.h"

@interface IWTabBarViewController () <IWTabBarDelegate>
/**
 *  自定义的tabbar
 */
@property (nonatomic, weak) IWTabBar *customTabBar;
@end

@implementation IWTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 初始化tabbar
    [self setupTabbar];
    
    // 初始化所有的子控制器
    [self setupAllChildViewControllers];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

/**
 *  初始化tabbar
 */
- (void)setupTabbar
{
    IWTabBar *customTabBar = [[IWTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar = customTabBar;
}

/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
- (void)tabBar:(IWTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    // 1.广场
    GBMSquareViewController *squareVC = VCFromSB(@"Square", @"squareVC");
    [self setupChildViewController:squareVC title:@"广场" imageName:@"square" selectedImageName:@"square_selected"];
    
    // 2.我的
    GBMMyViewController *myVC = [[GBMMyViewController alloc] init];
    [self setupChildViewController:myVC title:@"我的" imageName:@"my" selectedImageName:@"my_selected"];
    

}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 1.设置控制器的属性
    childVc.title = title;
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];

    childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 2.包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    nav.navigationBar.barTintColor = [UIColor colorFromHexCode:@"ee7f41"];
    [self addChildViewController:nav];
    nav.navigationController.hidesBottomBarWhenPushed = YES;
    //改变title的颜色
    [nav.navigationBar setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0F],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // 3.添加tabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}

- (void)addOrderView
{
    NSLog(@"点击了发布");
}


@end
