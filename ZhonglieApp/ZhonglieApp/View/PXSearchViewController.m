//
//  PXSearchViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/5/29.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXSearchViewController.h"
#import "PXMainCell.h"

@interface PXSearchViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *SearchV;

@end

@implementation PXSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationController.navigationItem.title = @"";
    
    self.navigationItem.title = @"职位搜索";
    
    [self setupFirstV];
    
    [self setupTableV];
}

//加载头部视图
-(void)setupFirstV
{
    UIView *FirstV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 49)];
    
    FirstV.backgroundColor = [UIColor blackColor];
    
    UIImageView *searchBackImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SearchHeaderV"]];
    
    [FirstV addSubview:searchBackImage];
    
    //加载搜索栏
    UITextField *searchBar = [[UITextField alloc]initWithFrame:CGRectMake(55, 12, 252, 33)];
    
    searchBar.background = [UIImage imageNamed:@"searchBarBack"];
    
    [FirstV addSubview:searchBar];
    
    //加载地区选择Btn
    UIButton *Diqu = [[UIButton alloc]initWithFrame:CGRectMake(10, 14, 40,25 )];
    
    
    [Diqu setTitle:@"北京" forState:UIControlStateNormal];
    [Diqu setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
//    [Diqu setBackgroundColor:[UIColor grayColor]];
    
    [FirstV addSubview:Diqu];
    
    
    
    
    [self.view addSubview:FirstV];
    
    
}


//加载tableView数据
-(void)setupTableV
{
    
    //创建tableView
    UITableView *SearchV = [[UITableView alloc]initWithFrame:CGRectMake(0, 116, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    [self.view addSubview:SearchV];
    
    
    //设置tableView数据源代理
    SearchV.dataSource = self;
    SearchV.delegate = self;
    _SearchV = SearchV;
    
}


#pragma mark - TableView数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

//自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"PXMainCell";
    
    PXMainCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[PXMainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


#pragma mark - TableView代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%zd", indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 96.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 96.0;
}

//headerView的高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}

//设置headerView的属性
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    
    headerV.backgroundColor = [UIColor greenColor];
    
    //创建三个筛选按钮
    UIButton *ShiJian = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 107,44)];
    
    ShiJian.backgroundColor = [UIColor yellowColor];
    
    [ShiJian setImage:[UIImage imageNamed:@"发布时间"] forState:UIControlStateNormal];
    
    [headerV addSubview:ShiJian];
    
    UIButton *JinE = [[UIButton alloc]initWithFrame:CGRectMake(107, 0, 107,44)];
    
    JinE.backgroundColor = [UIColor redColor];
    
    [JinE setImage:[UIImage imageNamed:@"奖励金额"] forState:UIControlStateNormal];
    
    [headerV addSubview:JinE];
    
    UIButton *ShaiXuan = [[UIButton alloc]initWithFrame:CGRectMake(214, 0, 107,44)];
    
    ShaiXuan.backgroundColor = [UIColor blueColor];
    
    [ShaiXuan setImage:[UIImage imageNamed:@"更多筛选"] forState:UIControlStateNormal];
    
    [headerV addSubview:ShaiXuan];
    
    return headerV;
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    //创建一个视图（v_headerView）
//    UIView *v_headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 23)];
//    
//    UIImageView *v_headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 23)];//创建一个UIimageView（v_headerImageView）
//    
//    v_headerImageView.image = [UIImage imageNamed:@"HeaderView"];//给v_headerImageView设置图片
//    
//    [v_headerView addSubview:v_headerImageView];//将v_headerImageView添加到创建的视图（v_headerView）中
//    
//    UILabel *v_headerLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 1, 100, 19)];//创建一个UILable（v_headerLab）用来显示标题
//    v_headerLab.backgroundColor = [UIColor clearColor];//设置v_headerLab的背景颜色
//    v_headerLab.textColor = [UIColor grayColor];//设置v_headerLab的字体颜色
//    v_headerLab.font = [UIFont fontWithName:@"Arial" size:13];//设置v_headerLab的字体样式和大小
//    v_headerLab.shadowColor = [UIColor whiteColor];//设置v_headerLab的字体的投影
//    [v_headerLab setShadowOffset:CGSizeMake(0, 1)];//设置v_headerLab的字体投影的位置
//    //设置每组的的标题
//    if (section == 0) {
//        v_headerLab.text = @"拍品导航";
//    }
//    if (section == 1) {
//        v_headerLab.text = @"专场特卖";
//    }
//    [v_headerView addSubview:v_headerLab];//将标题v_headerLab添加到创建的视图（v_headerView）中
//
//    return v_headerView;//将视图（v_headerView）返回
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
