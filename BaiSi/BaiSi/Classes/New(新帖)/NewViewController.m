//
//  NewViewController.m
//  BaiSi
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "NewViewController.h"
#import "XQRecommendedController.h"
@interface NewViewController ()

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self NavBarItem2];
    

    }

- (void)NavBarItem2{
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem buttonWithImage:[UIImage imageNamed:@"MainTagSubIcon"] heightWithImage:[UIImage imageNamed:@"MainTagSubIconClick"] addTarget:self action:@selector(MainTagSubIconClickLeftBtn)];
   
    
    self.navigationItem.titleView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}

- (void)MainTagSubIconClickLeftBtn{
    
    XQLOG;
    XQRecommendedController *recomVC=[[XQRecommendedController alloc] init];
    recomVC.view.backgroundColor=[UIColor whiteColor];
    
    [self.navigationController pushViewController:recomVC animated:YES];
    
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
