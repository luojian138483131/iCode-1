//
//  SLViewController.m
//  iCode
//
//  Created by SoolyChristina on 2016/10/31.
//  Copyright © 2016年 SoolyChrisitna. All rights reserved.
//

#import "SLViewController.h"

@interface SLViewController () <UIGestureRecognizerDelegate>

@end

@implementation SLViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    //设置navigationBar不透明
    self.navigationBar.translucent = NO;
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    self.interactivePopGestureRecognizer.delegate = self;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 不是第一个push进来的 左上角加上返回键
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [button sizeToFit];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    }
    [super pushViewController:viewController animated:animated];
}
-(void)backClick
{
    [super popViewControllerAnimated:YES];
}

#pragma mark UIGestureRecognizerDelegate 代理方法

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //    if (self.childViewControllers.count == 1) {
    //        return NO;
    //    }
    //    return YES;
    // 一句搞定
    return self.childViewControllers.count > 1;
}

@end
