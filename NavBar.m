//
//  NavBar.m
//  Tabbar
//
//  Created by hksmacmin on 2020/3/30.
//

#import "NavBar.h"
#import "AppThemeHelper.h"
@implementation NavBar

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit {
    
    self.translucent = NO;
    self.barTintColor = [AppThemeHelper defaultTheme].navigationBarBackgroundColor;
}


/**
 *  设置全局的导航栏背景图片
 *
 *  @param globalImg 全局导航栏背景图片
 */
+ (void)setGlobalBackGroundImage: (UIImage *)globalImg {
    
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[NSClassFromString(@"BaseNavigationController")]];
    [navBar setBackgroundImage:globalImg forBarMetrics:UIBarMetricsDefault];
    
    
}


/**
 *  设置全局导航栏标题颜色
 *
 *  @param globalTextColor 全局导航栏标题颜色
 */
+ (void)setGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize  {
    
    if (globalTextColor == nil) {
        return;
    }
    if (fontSize < 6 || fontSize > 40) {
        fontSize = 18;
    }
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[NSClassFromString(@"BaseNavigationController")]];
    // 设置导航栏颜色
    NSDictionary *titleDic = @{
                               NSForegroundColorAttributeName: globalTextColor,
                               NSFontAttributeName: [UIFont systemFontOfSize:fontSize]
                               };
    [navBar setTitleTextAttributes:titleDic];
}

@end
