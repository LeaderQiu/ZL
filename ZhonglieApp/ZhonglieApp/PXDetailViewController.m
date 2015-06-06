//
//  PXDetailViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/5.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXDetailViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "PXDetailCell.h"


@interface PXDetailViewController () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *DetailV;

@end

@implementation PXDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    //设置导航栏
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"职位详情";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(BackClickBtn)];
}

//跳转回上一个页面
-(void)BackClickBtn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}




#pragma mark - Table view data source


//几个section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

//每个组几个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section ==1) {
        return 4;
    } else if (section ==2) {
        return 5;
    } else {
        return 5;
    }
    
}

//自定义cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"flagCell";
    PXDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[PXDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
     
        NSInteger row = [indexPath row];
        
//        NSDictionary *rowData = [self];
      
        cell.DetailLable = @"冯明";
        cell.DetailPlaceholder = @"字猥琐";
    }
    
    
    return cell;
    
    
}


#pragma mark - TableView 代理


//每个组组名
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    } else if (section == 1) {
        return @"职位描述";
    } else if (section == 2) {
        return @"职位要求";
    } else {
        return @"企业介绍";
    }
    
}

//底部视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 60;
    }
    return 0;
}


//头部视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    } else {
        return 44;
    }
    
}

//自定义底部视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        UIView *TuiJianV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        
        TuiJianV.backgroundColor = [UIColor clearColor];
        
        UIButton *TuiJianBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 300, 49)];
        
        [TuiJianBtn setImage:[UIImage imageNamed:@"推荐Btn"] forState:UIControlStateNormal];
        [TuiJianV addSubview:TuiJianBtn];
        
        [self.view addSubview:TuiJianV];
        return TuiJianV;
    }
    return nil;
}



@end
