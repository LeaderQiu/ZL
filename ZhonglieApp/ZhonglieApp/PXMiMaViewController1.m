//
//  PXMiMaViewController1.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/12.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXMiMaViewController1.h"
#import "UIBarButtonItem+Extension.h"
#import "PXMiMaViewController2.h"

@interface PXMiMaViewController1 ()

@end

@implementation PXMiMaViewController1

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
    //设置第一个下划线
    UIImageView *ImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"下划线" ]];
    
    ImageV.frame = CGRectMake(10,120, 300,5);
    
    //设置第二个下划线
    UIImageView *ImageV2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"下划线" ]];
    
    ImageV2.frame = CGRectMake(10, 170, 300, 5);
    
 
    
    //下一步按钮
    UIButton *NextBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 220, 300, 49)];
    
    [NextBtn setImage:[UIImage imageNamed:@"下一步"] forState:UIControlStateNormal];
    
    [NextBtn addTarget:self action:@selector(NextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:NextBtn];
    [self.view addSubview:ImageV];
    [self.view addSubview:ImageV2];
}

//下一步按钮点击事件
-(void)NextBtnClick
{
    PXMiMaViewController2 *MiMaV2 = [[PXMiMaViewController2 alloc]init];
    
    [self.navigationController pushViewController:MiMaV2 animated:YES];
}

//导航栏返回键
-(void)BackClickBtn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
