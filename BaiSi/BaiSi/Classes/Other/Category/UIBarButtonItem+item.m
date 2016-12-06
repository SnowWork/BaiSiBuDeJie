//
//  UIBarButtonItem+item.m
//  BaiSi
//
//  Created by apple on 16/12/3.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "UIBarButtonItem+item.h"

@implementation UIBarButtonItem (item)
+ (UIBarButtonItem *)buttonWithImage:(UIImage *)image heightWithImage:(UIImage *)hightImage addTarget:( id)target action:(SEL)action
{
    UIButton  *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:hightImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIView *vi=[[UIView alloc] initWithFrame:btn.bounds];
    [vi addSubview:btn];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:vi];
    
}


+ (UIBarButtonItem *)buttonWithImage:(UIImage *)image selectedWithImage:(UIImage *)selectedImage addTarget:( id)target action:(SEL)action
{
    UIButton  *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIView *vi=[[UIView alloc] initWithFrame:btn.bounds];
    [vi addSubview:btn];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:vi];
    
}


+ (UIBarButtonItem *)buttonWithImage:(UIImage *)image heightWithImage:(UIImage *)heightImage addTarget:( id)target action:(SEL)action titleWithtitle:(NSString *)title
{
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:0];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:heightImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    btn.contentEdgeInsets =UIEdgeInsetsMake(0, -20, 0, 0);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}


@end
