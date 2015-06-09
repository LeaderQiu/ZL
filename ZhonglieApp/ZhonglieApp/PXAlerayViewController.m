//
//  PXAlerayViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/5/25.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXAlerayViewController.h"
#import "PXHistoryCell.h"

@interface PXAlerayViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PXAlerayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image: [UIImage imageNamed:@"已推荐"]selectedImage:[UIImage imageNamed:@"已推荐-hover"]];
    self.navigationController.tabBarItem.title = @"已推荐";

    self.navigationItem.title = @"推荐记录";
    
    self.tableView.rowHeight = 101;
    
    

}

//设置headerView的属性
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    UIImageView *backImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"头部背景"]];
    backImageV.frame = CGRectMake(0, 0, 320, 44);
    
    [headerV addSubview:backImageV];
    
    //创建三个筛选按钮
    UIButton *ShiJian = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 107,44)];
    
    [ShiJian setImage:[UIImage imageNamed:@"推荐时间"] forState:UIControlStateNormal];
    
    [headerV addSubview:ShiJian];
    
    UIButton *ZhuangTai = [[UIButton alloc]initWithFrame:CGRectMake(107, 0, 107,44)];
    
    [ZhuangTai setImage:[UIImage imageNamed:@"入职状态"] forState:UIControlStateNormal];
    
    [headerV addSubview:ZhuangTai];
    
    UIButton *DaiYu = [[UIButton alloc]initWithFrame:CGRectMake(214, 0, 107,44)];
    
    [DaiYu setImage:[UIImage imageNamed:@"薪资待遇"] forState:UIControlStateNormal];
    
    [headerV addSubview:DaiYu];
    
    return headerV;
    
    
    
    
}

#pragma mark - TableView Delegate DetaSource

//header的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

//自定义cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *HistoryID = @"HistoryCell";
    
    PXHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:HistoryID];
    
    if (cell == nil) {
        cell = [[PXHistoryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HistoryID];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
@end
