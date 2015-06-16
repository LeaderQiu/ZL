//
//  PXSuccessViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/9.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXSuccessViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "PXRuname2ViewController.h"

@interface PXSuccessViewController ()

@property(nonatomic,strong) UIButton *ChaKanBtn;
@property(nonatomic,strong) UIButton *JiXuBtn;

@end

@implementation PXSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(BackClickBtn)];
    
    self.navigationItem.title = @"投递成功";
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupBtn];
    
    [self setupImage];
}



//导航栏返回键
-(void)BackClickBtn
{
     PXRuname2ViewController *Runame2VC = [[PXRuname2ViewController alloc]init];
    
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionPush;//可更改为其他方式
    transition.subtype = kCATransitionFromLeft;//可更改为其他方式
//    [self.navigationController.view.layeraddAnimation:transition forKey:kCATransition];
    
    [self.navigationController pushViewController:Runame2VC animated:NO];
    
   
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}


//设置推荐成功图片
-(void)setupImage
{
    UIImageView *SuccessImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"推荐成功"]];
    
    SuccessImageV.frame = CGRectMake(43, 100, 234, 336);
    
    [self.view addSubview:SuccessImageV];
    
    
}

//设置两个Btn数据
-(void)setupBtn
{
  
    //设置查看推荐记录按钮
    UIButton *ChaKanBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 500, 145,48)];
    _ChaKanBtn = ChaKanBtn;
    
    [ChaKanBtn setBackgroundImage:[UIImage imageNamed:@"查看推荐记录"] forState:UIControlStateNormal];
    
    [ChaKanBtn setTitle:@"查看推荐记录" forState:UIControlStateNormal];
    
    [ChaKanBtn addTarget:self action:@selector(ChaKanClick) forControlEvents:UIControlEventTouchUpInside];

    //设置继续推荐按钮
    UIButton *JiXuBtn = [[UIButton alloc]initWithFrame:CGRectMake(165, 500, 145, 48)];
    _JiXuBtn = JiXuBtn;
    
    [JiXuBtn setBackgroundImage:[UIImage imageNamed:@"继续推荐"] forState:UIControlStateNormal];
    
    [JiXuBtn setTitle:@"继续推荐" forState:UIControlStateNormal];
    
    [JiXuBtn addTarget:self action:@selector(JiXuClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:ChaKanBtn];
    [self.view addSubview:JiXuBtn];
}

//点击查看
-(void)ChaKanClick
{
//    self.navigationController pushViewController:<#(UIViewController *)#> animated:<#(BOOL)#>
    
    NSLog(@"点击了查看");
}

//点击继续推荐
-(void)JiXuClick
{
    PXRuname2ViewController *Runame2VC = [[PXRuname2ViewController alloc]init];
    
    CATransition* transition = [CATransition animation];
    transition.type = kCATransitionPush;//可更改为其他方式
    transition.subtype = kCATransitionFromLeft;//可更改为其他方式
    //    [self.navigationController.view.layeraddAnimation:transition forKey:kCATransition];
    
    [self.navigationController pushViewController:Runame2VC animated:NO];
}

@end
