

//
//  BaseViewController.m
//  BaiSi
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "BaseViewController.h"

#import "EssenceViewController.h"
#import "FriendTrendViewController.h"
#import "MeTableViewController.h"
#import "NewViewController.h"

#import "XQNavigationController.h"

#import "XQTabBar.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


/*
 问题
 1.选中按钮的图片被渲染    IOS 之后默认 TabBar 上按钮图片都会被渲染
     1.修改图片
     2.通过代码
 2.选中按钮的标题颜色  黑色 标题字体  对应子控制器的 tabbartiem 
 3.发布按钮显示不出来
 
 
 */


//只会调用一次
+ (void)load{
    
//    获取哪个类中 UITabBarItem
    UITabBarItem *item=[UITabBarItem appearanceWhenContainedIn:self, nil];
    //设置按钮选中改标题的颜色 富文本:描述一个文字颜色  字体阴影 空心  图文混排
    //    创建一个描述文件属性的字典
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName]=[UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
//    设置字体尺寸 只有设置正常状态下  才会有效果
    NSMutableDictionary *attrNor=[NSMutableDictionary dictionary];
    attrNor[NSFontAttributeName]=[UIFont systemFontOfSize:13];

    [item setTitleTextAttributes:attrNor forState:UIControlStateNormal];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];


    [self tabBaseTabBar];

    [self setupAllTitleButton];
    
    [self setupTabBar];
}




#pragma mark -自定义 tabBar

- (void)setupTabBar{
    
    
    XQTabBar *tabBar=[[XQTabBar alloc] init];
    
    [self setValue:tabBar forKey:@"tabBar"];
}


- (void)tabBaseTabBar{
//    精华
    EssenceViewController *vc1=[[EssenceViewController alloc] init];
    XQNavigationController *nav1=[[XQNavigationController alloc] initWithRootViewController:vc1];
    [self addChildViewController:nav1];
    
//    新帖
    NewViewController *vc2=[[NewViewController alloc] init];
    XQNavigationController *nav2=[[XQNavigationController alloc] initWithRootViewController:vc2];
    [self addChildViewController:nav2];
    
//    关注
    FriendTrendViewController *vc3=[[FriendTrendViewController alloc] init];
    XQNavigationController *nav3=[[XQNavigationController alloc] initWithRootViewController:vc3];
    [self addChildViewController:nav3];
    
//    我
    MeTableViewController *vc5=[[MeTableViewController alloc] init];
    XQNavigationController *nav5=[[XQNavigationController alloc] initWithRootViewController:vc5];
    [self addChildViewController:nav5];

  

    
}
// 设置tabBar上所有按钮内容
- (void)setupAllTitleButton
{

    UINavigationController *nav1 = self.childViewControllers[0];
    nav1.tabBarItem.title = @"精华";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tabBar_essence_icon"];
    // 快速生成一个没有渲染图片
    nav1.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_essence_click_icon"];
    

    UINavigationController *nav2 = self.childViewControllers[1];
    nav2.tabBarItem.title = @"新帖";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tabBar_new_icon"];
    nav2.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_new_click_icon"];
    

    UINavigationController *nav3 = self.childViewControllers[2];
    nav3.tabBarItem.title = @"关注";
    nav3.tabBarItem.image = [UIImage imageNamed:@"tabBar_friendTrends_icon"];
    nav3.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_friendTrends_click_icon"];

    UINavigationController *nav4 = self.childViewControllers[3];
    nav4.tabBarItem.title = @"我";
    nav4.tabBarItem.image = [UIImage imageNamed:@"tabBar_me_icon"];
    nav4.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"tabBar_me_click_icon"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
