//
//  HeaderXQ.h
//  BaiSi
//
//  Created by apple on 16/12/3.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "UIImage+Image.h"
#import "UIView+frame.h"
#import "UIBarButtonItem+item.h"
#import <Foundation/Foundation.h>


#define XQLOG XMGLog(@"------");
/***********屏幕适配*************/
#define XMGScreenW [UIScreen mainScreen].bounds.size.width
#define XMGScreenH [UIScreen mainScreen].bounds.size.height
#define iphone6P (XMGScreenH == 736)
#define iphone6 (XMGScreenH == 667)
#define iphone5 (XMGScreenH == 568)
#define iphone4 (XMGScreenH == 480)
/***********屏幕适配*************/

#define XMGFunc XMGLog(@"%s",__func__)

#ifdef DEBUG // 调试

#define XMGLog(...) NSLog(__VA_ARGS__)

#else // 发布


#define XMGLog(...)

#endif
