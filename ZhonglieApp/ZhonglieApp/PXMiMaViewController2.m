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
#import "PXMiMaView2.h"
#import "Masonry.h"

@interface PXMiMaViewController2 ()

@end

@implementation PXMiMaViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"找回密码";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(BackClickBtn)];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self setupXib];
}

-(void)setupXib
{
    PXMiMaView2 *MiMaV2 = [[PXMiMaView2 alloc]initWithFrame:CGRectMake(0, 200, 320, 500) target:self action:@selector(QueRen)];
    
//    UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 500)];
//    backV.backgroundColor = [UIColor yellowColor];
    
//    [backV addSubview:MiMaV2];
    
//    [self.view addSubview:backV];
    
    [self.view addSubview:MiMaV2];
    
    [MiMaV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(64);
    }];
    
}


//下一步按钮点击事件
-(void)QueRen
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//导航栏返回键
-(void)BackClickBtn
{
    PXMiMaViewController1 *MiMaV1 = [[PXMiMaViewController1 alloc]init];
    
    [self.navigationController pushViewController:MiMaV1 animated:YES];
}

@end
