//
//  PXDetailViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/5.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXDetailViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface PXDetailViewController () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *DetailV;

@end

@implementation PXDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor yellowColor];
    
    
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%zd",arc4random()/5];
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
    if (section == 0) {
        return 0;
    } else {
        return 44;
    }
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
//
////每个cell高度
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}
//
////自定义底部视图
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    
//}
//
////自定义头部视图
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//}



@end
