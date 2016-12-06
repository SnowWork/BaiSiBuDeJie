//
//  XQADItem.h
//  BaiSi
//
//  Created by apple on 16/12/5.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import <Foundation/Foundation.h>
// w_picurl,ori_curl:跳转到广告界面,w,h
@interface XQADItem : NSObject

/** 广告地址*/
@property (nonatomic, strong) NSString  *w_picurl;

@property (nonatomic, strong) NSString  *ori_curl;

@property (nonatomic, assign) CGFloat w;

@property (nonatomic, assign) CGFloat h;

@end
