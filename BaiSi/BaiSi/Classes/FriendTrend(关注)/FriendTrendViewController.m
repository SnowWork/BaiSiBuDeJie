//
//  FriendTrendViewController.m
//  BaiSi
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "FriendTrendViewController.h"

#import "XQLogViewController.h"

@interface FriendTrendViewController ()

@end

@implementation FriendTrendViewController
- (IBAction)logBtn:(UIButton *)sender {
    
    XQLogViewController *logVC=[[XQLogViewController alloc] init];
    [self presentViewController:logVC animated:YES completion:nil];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self NavBarItem];
    
}

- (void)NavBarItem{
    
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem buttonWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] heightWithImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] addTarget:self action:@selector(friendsRecommentIconLeftBtn)];
    
    
    self.navigationItem.title=@"我的关注";
    
}
- (void)friendsRecommentIconLeftBtn{
    
    
    
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
