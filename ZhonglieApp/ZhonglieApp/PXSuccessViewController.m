//
//  PXSuccessViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/9.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXSuccessViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface PXSuccessViewController ()

@end

@implementation PXSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(BackClickBtn)];
    
    self.navigationItem.title = @"投递成功";
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

//
-(void)BackClickBtn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
