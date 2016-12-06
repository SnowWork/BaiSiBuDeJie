//
//  UIBarButtonItem+item.h
//  BaiSi
//
//  Created by apple on 16/12/3.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)
+ (UIBarButtonItem *)buttonWithImage:(UIImage *)image heightWithImage:(UIImage *)hightImage addTarget:( id)target action:(SEL)action;

+ (UIBarButtonItem *)buttonWithImage:(UIImage *)image selectedWithImage:(UIImage *)selectedImage addTarget:( id)target action:(SEL)action;
+ (UIBarButtonItem *)buttonWithImage:(UIImage *)image heightWithImage:(UIImage *)heightImage addTarget:( id)target action:(SEL)action titleWithtitle:(NSString *)title;
@end
