//
//  XQRecommendedController.m
//  BaiSi
//
//  Created by apple on 16/12/5.
//  Copyright © 2016年 zhangbaiquan. All rights reserved.
//

#import "XQRecommendedController.h"

#import <AFNetworking.h>
#import <MJExtension.h>
#import <SVProgressHUD.h>

#import "XQRecom.h"
#import "XQRecomCell.h"


static  NSString * const ID = @"cell";
@interface XQRecommendedController ()

@property (nonatomic, strong) NSArray  *arrayRecoms;
@property (nonatomic, weak) AFHTTPSessionManager *mar;
@end

@implementation XQRecommendedController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self loadData];
    
    
    self.navigationItem.title=@"推荐标签";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([XQRecomCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [SVProgressHUD showWithStatus:@"正在加载ing....."];
}

//1.请求 URL+ 参数  2.请求方式
//sub_number  theme_name  image_list
//tag_recommend   sub  topic
//http://api.budejie.com/api/api_open.php  GET

- (void)loadData{
    //1.创建对象
    AFHTTPSessionManager *mag=[AFHTTPSessionManager manager];
    _mar=mag;
    
//    2.添加参数
    NSMutableDictionary *parameters=[NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";;
    
//    3.发送请求
    [mag GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
//        [responseObject writeToFile:@"/Users/apple/Desktop/BaiSi/BaiSi/Classes/New(新帖)/recom.plist" atomically:YES ];
        
        [SVProgressHUD dismiss];
        //字典数组转模型数组
        
       _arrayRecoms= [XQRecom mj_objectArrayWithKeyValuesArray:responseObject];
        
        [self.tableView reloadData];

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD dismiss];
        XMGLog(@"%@",error);
    }];
}

//界面即将消失调用
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
//    销毁指示器
    [SVProgressHUD dismiss];
    
//    取消之前的请求
    [_mar.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrayRecoms.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // 自定义cell
    XQRecomCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
//    if (cell == nil) {
//        cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([XQRecomCell class]) owner:nil options:nil][0];
//    }
    // 获取模型
    XQRecom *item = self.arrayRecoms[indexPath.row];
    
    
    cell.item=item;
//    cell.textLabel.text = item.theme_name;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
