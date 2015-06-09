//
//  PXAlerayViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/5/25.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXAlerayViewController.h"

@interface PXAlerayViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PXAlerayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image: [UIImage imageNamed:@"已推荐"]selectedImage:[UIImage imageNamed:@"已推荐-hover"]];
    self.navigationController.tabBarItem.title = @"已推荐";

    self.navigationItem.title = @"推荐记录";
    
    
    

}

//设置headerView的属性
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
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

@end
