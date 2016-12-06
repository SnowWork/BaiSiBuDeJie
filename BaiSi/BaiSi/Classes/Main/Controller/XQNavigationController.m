//
//  XQNavigationController.m
//  BaiSi
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "XQNavigationController.h"

@interface XQNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation XQNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //全屏滑动UIPanGestureRecognizer
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition: )];
    
    [self.view addGestureRecognizer:pan];
    
    // 控制手势什么时候触发,只有非根控制器才需要触发手势
    pan.delegate=self;
    
    
//    关闭之前的自控制器滑动
    self.interactivePopGestureRecognizer.enabled=NO;
//
    

}

//是否触发
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(nonnull UITouch *)touch{
//    非根控制器为何这里为1 而不是0
    return self.childViewControllers.count>1;
    
}

//
+ (void)load
{
    //    self.navigationItem.titleTextAttributes=
    UINavigationBar *bar=[UINavigationBar appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attributes=[NSMutableDictionary dictionary];
    
    attributes[NSFontAttributeName]=[UIFont boldSystemFontOfSize:20];
    
    [bar setTitleTextAttributes:attributes];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count>0) {
        
        viewController.hidesBottomBarWhenPushed=YES;
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem buttonWithImage:[UIImage imageNamed:@"navigationButtonReturn"] heightWithImage:[UIImage imageNamed:@"navigationButtonReturnClick"] addTarget:self action:@selector(backBtn ) titleWithtitle:@"返回"];
        XMGLog(@"%@",self.interactivePopGestureRecognizer);
        
    }
    
    [super pushViewController:viewController animated:YES];
    
}
- (void)backBtn{
    XQLOG;
    [self popViewControllerAnimated:YES];
    
}


@end
