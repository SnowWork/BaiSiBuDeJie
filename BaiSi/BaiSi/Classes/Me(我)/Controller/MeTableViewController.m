//
//  MeTableViewController.m
//  BaiSi
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "MeTableViewController.h"
#import "XQTableViewController.h"
@interface MeTableViewController ()

@end

@implementation MeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self NavBarItem];
    
    
    

}



- (void)NavBarItem{
    UIBarButtonItem *barItem=[UIBarButtonItem buttonWithImage:[UIImage imageNamed:@"mine-moon-icon"] selectedWithImage:[UIImage imageNamed:@"mine-moon-icon-click"] addTarget:self action:@selector(mineLeftBtn:)];
    
    UIBarButtonItem *rightItem=[UIBarButtonItem buttonWithImage:[UIImage imageNamed:@"mine-setting-icon"] heightWithImage:[UIImage imageNamed:@"mine-setting-icon-click"] addTarget:self action:@selector(settingBtn)];
    
    self.navigationItem.rightBarButtonItems=@[rightItem,barItem];
    
    self.navigationItem.title=@"我的";
    
}
- (void)mineLeftBtn:(UIButton *)btn{
    
    btn.selected= ! btn.selected;
    
    
}

- (void)settingBtn{
    XQTableViewController *setting=[[XQTableViewController alloc] init];
    
    setting.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:setting animated:YES];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
