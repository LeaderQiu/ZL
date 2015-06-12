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
#import "PXMiMaView1.h"

@interface PXMiMaViewController1 ()

@end

@implementation PXMiMaViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"找回密码";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(BackClickBtn)];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self setupXib];
}

-(void)setupXib
{
    PXMiMaView1 *MiMaV1 = [[PXMiMaView1 alloc]initWithFrame:CGRectMake(0, 200, 320, 500) target:self action:@selector(NextBtnClick)];
    
    UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 500)];
    backV.backgroundColor = [UIColor yellowColor];
    
    [backV addSubview:MiMaV1];
    
    [self.view addSubview:backV];

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
