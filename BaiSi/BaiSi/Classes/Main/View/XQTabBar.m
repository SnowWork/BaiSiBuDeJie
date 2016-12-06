//
//  XQTabBar.m
//  BaiSi
//
//  Created by apple on 16/12/3.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "XQTabBar.h"
#import "PubloshViewController.h"
@interface XQTabBar ()

@property (nonatomic, weak) UIButton *plusButton;

@end



@implementation XQTabBar


- (UIButton *)plusButton{
    
    
    if (_plusButton==nil) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        
        [btn sizeToFit];
        
        [self addSubview:btn];
        
        _plusButton=btn;
        
    }
    return _plusButton;
}



- (void)layoutSubviews{
    
    [super layoutSubviews];
    
//    跳转 tabbarbutton 位置,现在有4个  需要+1
    NSInteger count=self.items.count;
    
    CGFloat btnW=self.bounds.size.width/(count+1);
    CGFloat btnH=self.bounds.size.height;
    CGFloat x=0;
    
    int i=0;
//    私有类:打印出来有个类,但是敲出来没有  说明这个类是系统私有类
//    遍历子控件 跳转布局
    for (UIView *tabBarButton in self.subviews) {
        
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            当索引等于2的时候,直接在加1 到索引为4.(0-4)
            if (i==2) {
                i+=1;
            }
            x=i*btnW;
            
            tabBarButton.frame=CGRectMake(x, 0, btnW, btnH);
            i++;
        }
    }
//    调整发布按钮位置
//    self.plusButton.center=CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5);

    // 调整发布按钮位置
    self.plusButton.center = CGPointMake( self.width* 0.5, self.height * 0.5);
    
}
















@end
