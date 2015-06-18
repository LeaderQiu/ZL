//
//  PXAlerayViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/5/25.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXAlerayViewController.h"
#import "PXHistoryCell.h"
#import "Masonry.h"

@interface PXAlerayViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UIButton *ShiJian;
@property(nonatomic,strong) UIButton *ZhuangTai;
@property(nonatomic,strong) UIButton *DaiYu;

@property(nonatomic,strong) UIView *AlertV1;
@property(nonatomic,strong) UIView *AlertV2;
@property(nonatomic,strong) UIView *AlertV3;
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
  
    UIView *headerV = [UIView new];
    
    UIImageView *backImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"头部背景"]];

    [headerV addSubview:backImageV];
    
    [self.view addSubview:headerV];
    
    //headerView约束
    [headerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.mas_equalTo(44);
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
    }];
    
    //backImageV约束
    [backImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(headerV);
    }];
    
    //创建三个筛选按钮
//    UIButton *ShiJian = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 107,44)];
    UIButton *ShiJian = [UIButton new];
    _ShiJian = ShiJian;
    
    [ShiJian setImage:[UIImage imageNamed:@"推荐时间"] forState:UIControlStateNormal];
    
    [ShiJian addTarget:self action:@selector(ShiJianClick) forControlEvents:UIControlEventTouchUpInside];
    
    [headerV addSubview:ShiJian];
    
//    UIButton *ZhuangTai = [[UIButton alloc]initWithFrame:CGRectMake(107, 0, 107,44)];
    UIButton *ZhuangTai = [UIButton new];
    _ZhuangTai = ZhuangTai;
    
    [ZhuangTai setImage:[UIImage imageNamed:@"入职状态"] forState:UIControlStateNormal];
    
    [ZhuangTai addTarget:self action:@selector(ZhuangTaiClick) forControlEvents:UIControlEventTouchUpInside];
    
    [headerV addSubview:ZhuangTai];
    
//    UIButton *DaiYu = [[UIButton alloc]initWithFrame:CGRectMake(214, 0, 107,44)];
    UIButton *DaiYu = [UIButton new];
    _DaiYu = DaiYu;
    
    [DaiYu setImage:[UIImage imageNamed:@"薪资待遇"] forState:UIControlStateNormal];
    
    [DaiYu addTarget:self action:@selector(DaiYuClick) forControlEvents:UIControlEventTouchUpInside];
    
    [headerV addSubview:DaiYu];
    
    //ShiJian约束
    
    int padding1 = ([UIScreen mainScreen].bounds.size.width/3);
    
    [ShiJian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(padding1);
        make.height.equalTo(headerV);
        make.top.equalTo(headerV);
        make.left.equalTo(headerV);
    }];
    
    //ZhuangTai约束
    [ZhuangTai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(padding1);
        make.height.equalTo(headerV);
        make.left.equalTo(ShiJian.mas_right);
        make.top.equalTo(headerV);
    }];
    
    //DaiYu约束
    [DaiYu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(padding1);
        make.height.equalTo(headerV);
        make.right.equalTo(headerV);
        make.top.equalTo(headerV);
    }];
    
    
    return headerV;
    
}

//点击推荐时间
-(void)ShiJianClick
{
    self.AlertV2.hidden = YES;
    self.AlertV3.hidden = YES;
    
    UIView *AlertV1 = [[UIView alloc]initWithFrame:CGRectMake(10, 44, 300, 59)];
    _AlertV1 = AlertV1;
    
    UIImageView *backImage1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"弹出框1"]];
    
    [AlertV1 addSubview:backImage1];
  
    [self.view addSubview:AlertV1];
}

//点击入职状态
-(void)ZhuangTaiClick
{
    self.AlertV1.hidden = YES;
    self.AlertV3.hidden = YES;
    
    UIView *AlertV2 = [UIView new];
    
    _AlertV2 = AlertV2;
    
    UIImageView *backImage1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"弹出框2"]];
    
    
    [self.view addSubview:AlertV2];
    [AlertV2 addSubview:backImage1];
    
    //AlertV约束
    
    [AlertV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view.mas_top).offset(44);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(59);
    }];
    
    //backImage约束
    [backImage1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(AlertV2);
        make.height.equalTo(AlertV2);
        make.edges.equalTo(AlertV2).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

//点击薪资待遇
-(void)DaiYuClick
{
    
    self.AlertV1.hidden = YES;
    self.AlertV2.hidden = YES;
    
    UIView *AlertV3 = [[UIView alloc]initWithFrame:CGRectMake(10, 44, 300, 59)];
    _AlertV3 = AlertV3;
    
    UIImageView *backImage1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"弹出框3"]];
    
    [AlertV3 addSubview:backImage1];
    [self.view addSubview:AlertV3];
}

//点击空白 隐藏AlertV  （没什么用）
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
   
    self.AlertV1.hidden = YES;
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

//点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.AlertV1.hidden = YES;
    self.AlertV2.hidden = YES;
    self.AlertV3.hidden = YES;
   
}
@end
