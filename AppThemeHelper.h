//
//  AppThemeHelper.h
//  Tabbar
//
//  Created by hksmacmin on 2020/3/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AppThemeHelper : NSObject

+ (instancetype)defaultTheme;

// default to white
@property (nonatomic, strong) UIColor *mainThemeColor;

// default to black
@property (nonatomic, strong) UIColor *mainThemeContrastColor;

// default to white
@property (nonatomic, strong) UIColor *navigationBarBackgroundColor;

// default to black
@property (nonatomic, strong) UIColor *navigationBarTintColor;

// default to black
@property (nonatomic, strong) UIColor *navigationBarBackColor;

// default to black
@property (nonatomic, strong) UIColor *navigationBarTitleColor;

@property (nonatomic, strong) UIColor *tabbarBackgroundColor;
@property (nonatomic, strong) UIColor *tabbarNormalColor;
@property (nonatomic, strong) UIColor *tabbarSelectedColor;


// 返回按钮icon，如果不指定，将使用模块内预置的返回图片
@property (nonatomic, strong) NSString *backButtonIconName;

@end
