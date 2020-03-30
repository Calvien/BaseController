//
//  BaseNavigationController.m
//  Tabbar
//
//  Created by hksmacmin on 2020/3/30.
//

#import "BaseNavigationController.h"
#import "AppThemeHelper.h"
#import "NavBar.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation BaseNavigationController

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setValue:[[NavBar alloc] init] forKey:@"navigationBar"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIGestureRecognizer *gester = self.interactivePopGestureRecognizer;
    
    UIScreenEdgePanGestureRecognizer *panGester = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:gester.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    
    panGester.edges = UIRectEdgeLeft;
    
    [gester.view addGestureRecognizer:panGester];
    
    gester.delaysTouchesBegan = YES;
    
    panGester.delegate = self;
}



#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if(self.childViewControllers.count == 1) {
        return NO;
    }
    
    return YES;
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {

        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:[AppThemeHelper defaultTheme].backButtonIconName] style:0 target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem.tintColor = [AppThemeHelper defaultTheme].navigationBarBackColor;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];

}
- (void)back {
    
    [self popViewControllerAnimated:YES];
    
}




@end
