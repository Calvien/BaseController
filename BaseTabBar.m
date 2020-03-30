//
//  BaseTabBar.m
//  Tabbar
//
//  Created by hksmacmin on 2020/3/30.
//

#import "BaseTabBar.h"
#import "AppThemeHelper.h"

@implementation BaseTabBar

-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUpInit];
    }
    return self;
}


- (void)setUpInit {
    
    // 设置样式, 去除tabbar上面的黑线
//    self.barStyle = UIBarStyleBlack;
    
//    // 设置tabbar 背景图片
//    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
//    NSString *bundleName = [currentBundle.infoDictionary[@"CFBundleName"] stringByAppendingString:@".bundle"];
//    NSString *path = [currentBundle pathForResource:@"tabbar_bg@3x.png" ofType:nil inDirectory:bundleName];
//    UIImage *image = [UIImage imageWithContentsOfFile:path];
//    self.backgroundImage = image;
    self.translucent = NO;
    self.backgroundColor = [AppThemeHelper defaultTheme].tabbarBackgroundColor;
}


@end
