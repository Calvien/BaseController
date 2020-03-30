//
//  BaseTabBarController.m
//  Tabbar
//
//  Created by hksmacmin on 2020/3/30.
//  Copyright © 2020 hksmacmin. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "AppThemeHelper.h"
#import "BaseTabBar.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue:[[BaseTabBar alloc] init] forKey:@"tabBar"];
    [self setupControllers];
//    self.tabBar.tintColor = [UIColor redColor];
}
+ (void)initialize
{
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    if (@available(iOS 13.0, *)) {
        UITabBar * bar = [UITabBar appearance];
        bar.tintColor = [AppThemeHelper defaultTheme].tabbarSelectedColor;
        bar.unselectedItemTintColor = [AppThemeHelper defaultTheme].tabbarNormalColor;
        
    }
    else{

    attrs[NSForegroundColorAttributeName] = [AppThemeHelper defaultTheme].tabbarNormalColor;
    

    selectedAttrs[NSForegroundColorAttributeName] = [AppThemeHelper defaultTheme].tabbarSelectedColor;
    
    }
    
    UITabBarItem * item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

-(void)setupControllers{
    NSArray *arr = @[
        @{@"clsName":@"HomeViewController",@"title":@"首页",@"imageName":@"tabbar_home"},
        @{@"clsName":@"DiscoverViewController",@"title":@"发现",@"imageName":@"tabbar_discover"},
        @{@"clsName":@"MessageViewController",@"title":@"消息",@"imageName":@"tabbar_message"},
        @{@"clsName":@"ProfileViewController",@"title":@"我",@"imageName":@"tabbar_profile"}
    ];
    
    for (NSDictionary *dic in arr) {
        UIViewController *vc = [self fetchViewCotrollerWithDic:dic];
        [self addChildViewController:vc];
    }
    
}

-(UIViewController*)fetchViewCotrollerWithDic:(NSDictionary*)dic{
    NSString *title = dic[@"title"];
    NSString *imageName = dic[@"imageName"];
    NSString *selectedImage = [imageName stringByAppendingString:@"_selected"];
    UIViewController *vc = [[NSClassFromString(dic[@"clsName"]) alloc] init];
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
      nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title?:@"" image:[self originImageWithName:imageName] selectedImage:[self originImageWithName:selectedImage]];
//    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
//    attrs[NSForegroundColorAttributeName] =[UIColor redColor];
//    [nav.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateNormal];
    return nav;
    
}

-(UIImage*)originImageWithName:(NSString*)name{
    UIImage * img =  [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return img;
}

@end
