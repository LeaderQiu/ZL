//
//  PXNavViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/2.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXNavViewController.h"

@interface PXNavViewController ()

@end

@implementation PXNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(void)loadNavBarItem {
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    titleLabel.font = CLNNCommonBigTextSize;
//    titleLabel.text = self.title;
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.textColor = CLNNCommonDarkGrayColor;
//    [titleLabel sizeToFit];
//    self.navigationItem.titleView = titleLabel;
//    
//    UIButton *btnReturn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btnReturn setBackgroundImage:[UIImage imageNamed:@"返回按钮"] forState:UIControlStateNormal];
//    [btnReturn sizeToFit];
//    btnReturn.exclusiveTouch = YES;
//    btnReturn.backgroundColor = [UIColor clearColor];
//    [btnReturn addTarget:self action:@selector(btnReturnClicked) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btnReturn];
//    self.navigationItem.leftBarButtonItem = leftItem;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
