//
//  PXWeChatViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/23.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXWeChatViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "Masonry.h"
#import "PXUserViewController.h"

@interface PXWeChatViewController ()

@property(nonatomic,strong) UIButton *WeiXin;
@property(nonatomic,strong) UIButton *ZhangHao;
@end

@implementation PXWeChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"帐号中心";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupBtn];
    
    [self setupImage];
    
}



-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}

//设置背景图片
-(void)setupImage
{
    UIImageView *SuccessImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"WeChat登录背景"]];
   
    
    [self.view addSubview:SuccessImageV];
    
    //SuccessImageV约束
    [SuccessImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(100);
    }];
    
    
}

//设置两个Btn数据
-(void)setupBtn
{
    
    //设置微信授权按钮

    
    UIButton *WeiXin = [UIButton new];
    _WeiXin = WeiXin;
    
    [WeiXin setBackgroundImage:[UIImage imageNamed:@"矩形-3"] forState:UIControlStateNormal];
    
    [WeiXin setTitle:@"微信授权" forState:UIControlStateNormal];
    
    [WeiXin addTarget:self action:@selector(WeiXinClick) forControlEvents:UIControlEventTouchUpInside];
    
    //设置帐号登录按钮

    UIButton *ZhangHao = [UIButton new];
    _ZhangHao = ZhangHao;
    
    [ZhangHao setBackgroundImage:[UIImage imageNamed:@"矩形-3-拷贝"] forState:UIControlStateNormal];
    
    [ZhangHao setTitle:@"帐号登陆" forState:UIControlStateNormal];
    
    [ZhangHao addTarget:self action:@selector(ZhangHaoClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:WeiXin];
    [self.view addSubview:ZhangHao];
    
    //设置两个Btn约束
    int padding1 = 20;
    
    [WeiXin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(padding1);
        make.bottom.equalTo(self.view.mas_bottom).offset(-padding1);
        make.right.equalTo(ZhangHao.mas_left).offset(-padding1);
        make.height.mas_equalTo(48);
        make.width.equalTo(ZhangHao);
        
    }];
    
    [ZhangHao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-padding1);
        make.bottom.equalTo(self.view.mas_bottom).offset(-padding1);
        make.left.equalTo(WeiXin.mas_right).offset(-padding1);
        make.height.mas_equalTo(48);
        
    }];
}

//点击微信登录
-(void)WeiXinClick
{
    PXUserViewController *VC = [[PXUserViewController alloc]init];
    
    [self.navigationController pushViewController:VC animated:YES];
    
    NSLog(@"点击了微信登录");
}

//点击帐号登录
-(void)ZhangHaoClick
{

    NSLog(@"点击了帐号登录");
}


@end
