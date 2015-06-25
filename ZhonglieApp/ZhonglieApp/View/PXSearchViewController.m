//
//  PXSearchViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/5/29.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXSearchViewController.h"
#import "PXMainCell.h"
#import "UIBarButtonItem+Extension.h"
#import "Masonry.h"
#import "PXCityViewController.h"
#import "UIColor+SYExtension.h"


@interface PXSearchViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property(nonatomic,strong) UITableView *SearchV;
@property(nonatomic,strong) UITextField *TextField;
@end

@implementation PXSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //优化导航栏
    self.navigationController.navigationItem.title = @"";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(btnClickAction)];
    
    self.navigationItem.title = @"职位搜索";
   
    
    [self setupFirstV];

   
    
    [self setupTableV];
}

//导航栏返回键
-(void)btnClickAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//加载头部视图
-(void)setupFirstV
{
    UIView *FirstV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 55)];

    
    //加载搜索栏
    UITextField *TextField = [UITextField new];
    
    _TextField = TextField;
    
    [self setupTextFiel];
    
    [FirstV addSubview:TextField];
    
   
    
    //加载地区选择Btn
    UIButton *Diqu = [UIButton new];

    [Diqu setTitleColor:[UIColor colorWithRGB:0x419dd6] forState:UIControlStateNormal];
    
    [Diqu addTarget:self action:@selector(DiquBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [FirstV addSubview:Diqu];
    
    [Diqu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(FirstV);
        make.left.equalTo(FirstV.mas_left).offset(10);
        make.width.mas_equalTo(70);
        make.top.equalTo(FirstV.mas_top).offset(10);
        make.bottom.equalTo(FirstV.mas_bottom).offset(-10);
    }];
    
    UILabel *Label1 = [UILabel new];
    
    Label1.text = @"北京";
    
    Label1.textColor = [UIColor colorWithRGB:0x419dd6];
    
    [Diqu addSubview:Label1];
    
    [self.view addSubview:FirstV];
    
    [Label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Diqu.mas_left);
        make.top.equalTo(Diqu.mas_top).offset(10);
        make.bottom.equalTo(Diqu.mas_bottom).offset(-10);
    }];
    
    UIImageView *Image = [UIImageView new];
    
    [Image setImage:[UIImage imageNamed:@"下三角1"]];
    
    [Diqu addSubview:Image];
    
    [Image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(6);
        make.left.equalTo(Label1.mas_right).offset(10);
        make.centerY.equalTo(Label1);
    }];
    
    
    //TextField约束
    [TextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Diqu.mas_right).offset(10);
        make.right.equalTo(FirstV).offset(-10);
        make.top.equalTo(FirstV.mas_top).offset(8);
        make.bottom.equalTo(FirstV.mas_bottom).offset(-10);
        
    }];
    
    UIView *bottomV = [UIView new];
    
    bottomV.backgroundColor = [UIColor colorWithRGB:0xececec];
    
    [FirstV addSubview:bottomV];
    
    [bottomV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.width.equalTo(FirstV);
        make.bottom.equalTo(FirstV.mas_bottom).offset(-3);
    }];
}

//点击地区选择
-(void)DiquBtnClick
{
    PXCityViewController *VC = [[PXCityViewController alloc]init];
    
    [self.navigationController pushViewController:VC animated:YES];
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
    
    //创建三个筛选按钮

    UIButton *ShiJian = [UIButton new];
    
    [ShiJian setBackgroundImage:[UIImage imageNamed:@"筛选按钮"] forState:UIControlStateNormal];
    UILabel *Label2 = [UILabel new];
    
    Label2.text = @"发布时间";
    
    Label2.textColor = [UIColor colorWithRGB:0x0087D0];
    
    [ShiJian addSubview:Label2];
    
    [Label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ShiJian.mas_top).offset(10);
        make.left.equalTo(ShiJian.mas_left).offset(20);
        
    }];
    
    [headerV addSubview:ShiJian];
      
    UIButton *JinE = [UIButton new];
    
    [JinE setBackgroundImage:[UIImage imageNamed:@"筛选按钮"] forState:UIControlStateNormal];

    UILabel *Label1 = [UILabel new];
    
    Label1.text = @"奖励金额";
    
    Label1.textColor = [UIColor colorWithRGB:0x0087D0];
    
    [JinE addSubview:Label1];
    
    [Label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(JinE.mas_top).offset(10);
        make.left.equalTo(JinE.mas_left).offset(20);
        
    }];
    
    [headerV addSubview:JinE];
    
    UIButton *ShaiXuan = [UIButton new];
    
    [ShaiXuan setBackgroundImage:[UIImage imageNamed:@"筛选按钮"] forState:UIControlStateNormal];
    
    UILabel *Label3 = [UILabel new];
    
    Label3.text = @"更多筛选";
    
    Label3.textColor = [UIColor colorWithRGB:0x0087D0];
    
    [ShaiXuan addSubview:Label3];
    
    [Label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ShaiXuan.mas_top).offset(10);
        make.left.equalTo(ShaiXuan.mas_left).offset(20);
        
    }];
    
    [headerV addSubview:ShaiXuan];
    
    
    //ShiJian约束
    
    int padding1 = [UIScreen mainScreen].bounds.size.width/3;
    
    [ShiJian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerV);
        make.height.equalTo(headerV);
        make.left.equalTo(headerV);
        make.right.equalTo(JinE.mas_left);
        make.width.mas_equalTo(padding1);
        
    }];
    
    //JinE约束
    [JinE mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerV);
        make.left.equalTo(ShiJian.mas_right);
        make.height.equalTo(headerV);
        make.right.equalTo(ShaiXuan.mas_left);
        make.width.mas_equalTo(padding1);
    }];
    
    //ShaiXuan约束
    [ShaiXuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerV);
        make.left.equalTo(JinE.mas_right);
        make.height.equalTo(headerV);
        make.right.equalTo(headerV);
        make.width.mas_equalTo(padding1);
    }];
    
    return headerV;
    
    
}


//设置TextField细节
-(void)setupTextFiel
{
    
    self.TextField.borderStyle = UITextBorderStyleNone;
    self.TextField.keyboardType = UIKeyboardTypeDefault;
    self.TextField.delegate = self;
    
    self.TextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.TextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.TextField.returnKeyType = UIReturnKeySearch;
    
    self.TextField.background = [UIImage imageNamed:@"搜索栏背景"];
    
    
    UIImageView *Searchimage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"查找职位"]];
    self.TextField.leftView=Searchimage;
    self.TextField.leftViewMode = UITextFieldViewModeUnlessEditing;
    
    self.TextField.userInteractionEnabled = YES;
    
    self.TextField.textColor = [UIColor whiteColor];
    
    self.TextField.clearsOnBeginEditing = YES;
    
    self.TextField.font = [UIFont fontWithName:@"Helvetica-Bold"size:16];
    
    
}

#pragma mark - TextField代理方法

//开始编辑时隐藏查找职位图片
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    self.TextField.leftViewMode = UITextFieldViewModeNever;
}


//点击键盘搜索键，收回键盘.***跳转页面****
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    textField.text = @" ";
    
    
    [self updateViewConstraints];
    
    return YES;
    
}

//结束编辑时显示查找职位图片
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.TextField.leftViewMode = UITextFieldViewModeUnlessEditing;
    
}
//点击空白收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_TextField resignFirstResponder];
    
    _TextField.text = @" ";
}


@end
