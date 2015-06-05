//
//  PXDetailViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/5.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXDetailViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface PXDetailViewController ()


@end

@implementation PXDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UITableView *DetailV = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    _DetailV = DetailV;
//    
//    self.DetailV.delegate = self;
//    self.DetailV.dataSource = self;
//    
//    self.DetailV.backgroundColor = [UIColor whiteColor];
//    
//    self.DetailV.rowHeight = 88;
//    
//    [self.view addSubview:DetailV];
    
    UITableView *a = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    a.rowHeight = 44;
    a.delegate = self;
    a.dataSource = self;
    
    
    
    [self.view addSubview:a];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

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


@end
