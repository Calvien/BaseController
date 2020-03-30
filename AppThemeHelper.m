//
//  AppThemeHelper.m
//  Tabbar
//
//  Created by hksmacmin on 2020/3/30.
//

#import "AppThemeHelper.h"

@implementation AppThemeHelper

+ (instancetype)defaultTheme
{
    static AppThemeHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AppThemeHelper alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    
    if ( self ) {
        _mainThemeColor = [UIColor whiteColor];
        _mainThemeContrastColor = [UIColor blackColor];
        
        _navigationBarBackgroundColor = [UIColor whiteColor];
        _navigationBarTintColor = [UIColor blackColor];
        _navigationBarBackColor = [UIColor blackColor];
        _navigationBarTitleColor = [UIColor blackColor];
        
        _tabbarNormalColor = [UIColor yellowColor];
        _tabbarSelectedColor = [UIColor blueColor];
        _backButtonIconName = @"navigation_bar_back";
        
    }
    
    return self;
}

@end
