//
//  XQRecomCell.m
//  BaiSi
//
//  Created by apple on 16/12/5.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "XQRecomCell.h"
#import "XQRecom.h"

#import <UIImageView+WebCache.h>

@interface XQRecomCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLa;

@property (weak, nonatomic) IBOutlet UILabel *numLa;

@end

@implementation XQRecomCell

- (void)setItem:(XQRecom *)item{
    
    _item=item;
    _nameLa.text=item.theme_name;
//    _numLa.text=item.sub_number;
   NSString * numStr=[NSString stringWithFormat:@"%@人订阅",item.sub_number];
    NSInteger  num=item.sub_number.integerValue;
    
    if (num >10000) {
        CGFloat numF=num/10000.0;
        
        numStr =[NSString stringWithFormat:@"%.1f万人订阅",numF];
        numStr=[numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
        
    }
    _numLa.text=numStr;
    
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] options:SDWebImageCacheMemoryOnly completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        1.开启上下文
        UIGraphicsBeginImageContextWithOptions(image.size,NO,0);
//        2.描述裁减区域
        UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//        3.设置裁减区域
        [path addClip];
//        4.画图片
        [image drawAtPoint:CGPointZero];
//        5.取出图片
        image=UIGraphicsGetImageFromCurrentImageContext();
//        6.关闭上下文
        UIGraphicsEndImageContext();
        
        _iconImageView.image=image;
        
        
        
    }];
    
}
- (void)awakeFromNib {
    [super awakeFromNib];

//    _iconImageView.layer.cornerRadius=60*0.5;
//    _iconImageView.layer.masksToBounds=YES;
    
    


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
