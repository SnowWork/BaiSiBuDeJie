//
//  UIImage+Image.m
//  BaiSi
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (UIImage *)imageOriginalWithName:(NSString *)imageName
{
    
    UIImage *image=[UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
