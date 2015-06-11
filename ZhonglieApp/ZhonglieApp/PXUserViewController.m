//
//  PXUserViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/5/25.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXUserViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIColor+SYExtension.h"
#import "PXUserCenterView.h"
#import "AFNetworking.h"


@interface PXUserViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation PXUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image: [UIImage imageNamed:@"我的"]selectedImage:[UIImage imageNamed:@"我的-hover"]];
    
    self.navigationController.tabBarItem.title = @"我的";
    
    self.navigationController.navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setupHeaderV];
    
    [self setupBtnV];
    
    [self setupTableV];
 
}

//设置头部数据
-(void)setupHeaderV
{
    UIView *HeaderV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 159)];
    
    UIImageView *BackImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我的背景"]];
    
    [HeaderV addSubview:BackImageV];
    [self.view addSubview:HeaderV];
    
}


//设置BtnView数据
-(void)setupBtnV
{
    UIView *BtnV = [[UIView alloc]initWithFrame:CGRectMake(0, 159, self.view.bounds.size.width, 51)];
    
    UIButton *TJJLBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 161, 51)];
    
    [TJJLBtn setBackgroundImage:[UIImage imageNamed:@"矩形-6"] forState:UIControlStateNormal];
    
    [TJJLBtn setTitle:@"推荐记录" forState:UIControlStateNormal];

    [TJJLBtn setTitleColor:[UIColor colorWithRGB:0x25a1db] forState:UIControlStateNormal];
    
    [TJJLBtn addTarget:self action:@selector(TJJLBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [BtnV addSubview:TJJLBtn];
    

    
    UIButton *JJGLBtn = [[UIButton alloc]initWithFrame:CGRectMake(161, 0, 161, 51)];
    
    [JJGLBtn setBackgroundImage:[UIImage imageNamed:@"矩形-6"] forState:UIControlStateNormal];
    
    [JJGLBtn setTitle:@"简历管理" forState:UIControlStateNormal];
    
    [JJGLBtn setTitleColor:[UIColor colorWithRGB:0x25a1db] forState:UIControlStateNormal];
    
    [BtnV addSubview:JJGLBtn];
    [self.view addSubview:BtnV];
    
 

    
}

//设置DataView数据
-(void)setupDataV
{
    
    UITableView *DataBackV = [[UITableView alloc]initWithFrame:CGRectMake(0, 220, self.view.bounds.size.width, 250)];
    
    DataBackV.delegate = self;
    DataBackV.dataSource = self;
    
    PXUserCenterView *dataV = [[PXUserCenterView alloc]initWithFrame:CGRectMake(100, 300, self.view.bounds.size.width, 250)];
    
    [DataBackV addSubview:dataV];
    [self.view addSubview:DataBackV];
    
    
    
}

//设置TableV数据
-(void)setupTableV
{
    UIScrollView *TableV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 220, [UIScreen mainScreen].bounds.size.width, 350)];

    
    TableV.contentSize = CGSizeMake(320, 400);
    TableV.userInteractionEnabled = YES;
    TableV.scrollEnabled = YES;
    
    TableV.backgroundColor = [UIColor grayColor];
//    
    //加载dataV
    PXUserCenterView *dataV = [[PXUserCenterView alloc]initWithFrame:CGRectMake(100, 300, self.view.bounds.size.width, 250)];
    
    [TableV addSubview:dataV];
//
//    //加载MiMaV
    
    UIView *MiMaV = [[UIView alloc]initWithFrame:CGRectMake(0, 260, self.view.bounds.size.width, 51)];
    MiMaV.backgroundColor = [UIColor whiteColor];
    
    UIImageView *MiMaImageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 19, 18, 18)];
    [MiMaImageV setImage:[UIImage imageNamed:@"lock-256"]];
    
    UIButton *MiMaBtn = [[UIButton alloc]initWithFrame:CGRectMake(38, 0, 300, 51)];
    [MiMaBtn setTitle:@"密码中心" forState:UIControlStateNormal];
    
    //title居左
    MiMaBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //title颜色
    [MiMaBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    
    MiMaBtn.userInteractionEnabled = YES;
    
    [MiMaBtn addTarget:self action:@selector(MiMaClick) forControlEvents:UIControlEventTouchUpInside];
    
    [MiMaV addSubview:MiMaImageV];
    [MiMaV addSubview:MiMaBtn];
    [TableV addSubview:MiMaV];
//
    //加载用户登出按钮
    UIView *OutV = [[UIView alloc]initWithFrame:CGRectMake(0, 311, self.view.bounds.size.width, 300)];
    
    OutV.backgroundColor = [UIColor clearColor];
    
    UIButton *TuiChuBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 300, 49)];
    
    [TuiChuBtn setBackgroundImage:[UIImage imageNamed:@"退出登录"] forState:UIControlStateNormal];
    
    [TuiChuBtn setTitle:@"帐号退出" forState:UIControlStateNormal];
    
    [OutV addSubview:TuiChuBtn];
    
    [TableV addSubview:OutV];

    [self.view addSubview:TableV];
}

//密码中心点击事件
//-(void)MiMaClick
//{
//    NSLog(@"密码中心");
//}
//
////推荐记录Btn点击事件
//-(void)TJJLBtnClick
//{
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    
//    NSString *url = @"http://192.168.1.103/zhonglie/index.php/home/position/positionList";
//    
//    NSDictionary *params = @{@"Page":@"1"};
//    
//    [mgr POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //成功回掉
//        NSLog(@"网络请求成功==》%@",responseObject);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        //失败回掉
//        NSLog(@"网络请求失败==》%@",error);
//    }];
//    
//}

-(void)TJJLBtnClick
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"Page": @"2"};
    [manager POST:@"http://192.168.1.103/zhonglie/index.php/home/position/positionList" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) { NSLog(@"网络请求成功: %@", responseObject); } failure:^(AFHTTPRequestOperation *operation, NSError *error) { NSLog(@"网络请求失败: %@", error); }];
}
@end
