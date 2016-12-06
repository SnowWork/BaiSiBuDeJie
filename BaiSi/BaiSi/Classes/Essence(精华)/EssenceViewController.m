//
//  EssenceViewController.m
//  BaiSi
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "EssenceViewController.h"



@interface EssenceViewController ()

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self NavBarItem1];



}

- (void)NavBarItem1{
    
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem buttonWithImage:[UIImage imageNamed:@"nav_item_game_icon"] heightWithImage:[UIImage imageNamed:@"nav_item_game_click_icon"] addTarget:self action:@selector(leftBtn)];
    
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem buttonWithImage:[UIImage imageNamed:@"navigationButtonRandom"] heightWithImage:[UIImage imageNamed:@"navigationButtonRandomClick"] addTarget:self action:@selector(rightBtn)];
    
    self.navigationItem.titleView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    
}


- (void)leftBtn{
    
    XQLOG;
}

- (void)rightBtn{
    
    XQLOG;
    
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
