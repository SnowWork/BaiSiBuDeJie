//
//  XQADViewController.m
//  BaiSi
//
//  Created by apple on 16/12/4.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

/*
 1.广告业务逻辑
 2.占位视图思想:有个控件不确定尺寸,但是层次结构已经确定,就可以使用占位视图思想
 3.屏幕适配.通过屏幕高度判断
 */

#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"


#import "XQADViewController.h"
#import "XQADItem.h"
#import "BaseViewController.h"


#import <AFNetworking/AFNetworking.h>
#import <MJExtension.h>
#import <UIImageView+WebCache.h>

@interface XQADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *lauchImage;
@property (weak, nonatomic) IBOutlet UIView *AdView;
@property (weak, nonatomic) IBOutlet UIButton *jmpBtn;

@property (nonatomic, weak) UIImageView *adImage;
@property (nonatomic, strong) XQADItem *adItem;
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation XQADViewController
- (UIImageView *)adImage{
    if (!_adImage) {
        UIImageView *image=[[UIImageView alloc] init];
        
        [self.AdView addSubview:image];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [image addGestureRecognizer:tap];
        image.userInteractionEnabled=YES;
        _adImage=image;
    }
    return _adImage;
}
- (void)tap{
    
    // 跳转到界面 => safari
    NSURL *url = [NSURL URLWithString:_adItem.ori_curl];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }
//    BaseViewController *base=[[BaseViewController alloc] init];
//    
//    [UIApplication sharedApplication].keyWindow.rootViewController=base;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self lauchImageWithImage];
    
    [self loadAdData];
    
    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerBtnClick) userInfo:nil repeats:YES];
    
}
- (void)timerBtnClick{
    
    static int i=3;
    
    if ( i == 0) {
        [self clipTimer:nil];
    }
    i--;
    
    [_jmpBtn setTitle:[NSString stringWithFormat:@"跳转 (%d)",i] forState:UIControlStateNormal];
    [_jmpBtn addTarget:self action:@selector(clipTimer:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clipTimer:(UIButton *)sender{
    
        BaseViewController *tab=[[BaseViewController alloc] init];
    //定时器到时间以后跳转
        [UIApplication sharedApplication].keyWindow.rootViewController=tab;
    //记得关闭定时器
        [_timer invalidate];
}
- (void)loadAdData
{
    
    // unacceptable content-type: text/html"  响应头
    
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    
    // 3.发送请求
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php/" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        // 请求数据 -> 解析数据 -> 展示数据
//        [responseObject writeToFile:@"/Users/apple/Desktop/BaiSi/BaiSi/Classes/AD(广告)/ad.plist" atomically:YES];
        NSDictionary *adDict=[responseObject[@"ad"]lastObject];
        
        //字典转模型
        _adItem=[XQADItem mj_objectWithKeyValues:adDict];
        
        //创建 imageView 的位置
        CGFloat h=XMGScreenW/_adItem.w*_adItem.h;
        self.adImage.frame=CGRectMake(0, 0, XMGScreenW, h);
        
        [self.adImage sd_setImageWithURL:[NSURL URLWithString:_adItem.w_picurl]];
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}


- (void)lauchImageWithImage{
    
    if (iphone6P) { // 6p
        self.lauchImage.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iphone6) { // 6
        self.lauchImage.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iphone5) { // 5
        self.lauchImage.image = [UIImage imageNamed:@"LaunchImage-568h"];
        
    } else if (iphone4) { // 4
        
        self.lauchImage.image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    
    
    
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
