//
//  PXMiMaViewController2.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/12.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXMiMaViewController2.h"
#import "UIBarButtonItem+Extension.h"
#import "PXMiMaViewController1.h"

@interface PXMiMaViewController2 ()

@end

@implementation PXMiMaViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"找回密码";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(BackClickBtn)];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupView];
}

//加载View内容
-(void)setupView
{
    UIImageView *ImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"下划线" ]];
    
    ImageV.frame = CGRectMake(10, 100, 300, 49);
    
    UIImageView *ImageV2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"下划线" ]];
    
    ImageV.frame = CGRectMake(10, 150, 300, 49);
    
    //下一步按钮
    UIButton *NextBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, 300, 49)];
    
    [NextBtn setImage:[UIImage imageNamed:@"确认"] forState:UIControlStateNormal];
    
    [NextBtn addTarget:self action:@selector(NextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:NextBtn];
    [self.view addSubview:ImageV];
    [self.view addSubview:ImageV2];
}

//下一步按钮点击事件
-(void)NextBtnClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//导航栏返回键
-(void)BackClickBtn
{
    PXMiMaViewController1 *MiMaV1 = [[PXMiMaViewController1 alloc]init];
    
    
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionPush;//可更改为其他方式
    transition.subtype = kCATransitionFromLeft;//可更改为其他方式
    
    [self.navigationController pushViewController:MiMaV1 animated:YES];
}

@end
