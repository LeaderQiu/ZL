//
//  PXTableViewController.m
//  ZhonglieApp
//
//  Created by mukang on 15/5/25.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXRunameViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "PXRunameCell.h"
#import "PXAddRunameViewController.h"
#import "PXEditRunameViewController.h"
#import "Masonry.h"


@interface PXRunameViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITextField *TextField;

@property(nonatomic,strong) UITableView *tableV;

@property(nonatomic,strong) NSMutableArray *myArray;

@end

@implementation PXRunameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image: [UIImage imageNamed:@"简历"]selectedImage:[UIImage imageNamed:@"简历-hover"]];
    
    self.navigationController.tabBarItem.title = @"简历";
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"简历管理";
    
    [self setupFirstV];
    
    [self setupTableV];
    
    NSMutableArray *myArray = [NSMutableArray arrayWithObjects:@"one",@"two",@"three",@"four",@"five",@"six",@"seven",@"eight",@"",nil];
    _myArray =  myArray;
    
    
}

-(void)setupFirstV
{
     UIView *FirstV = [UIView new];
    
    [FirstV setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"搜索栏Cell背景"]]];

    
    //添加TextFiel
    UITextField *TextField = [UITextField new];
    
    _TextField = TextField;
    
    [self setupTextFiel];
    [FirstV addSubview:TextField];
    
    [self.view addSubview:FirstV];
    
    //FirstV约束
    [FirstV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.height.mas_equalTo(49);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.equalTo(self.view);
    }];
    
    //TextField约束
    [TextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(FirstV).insets(UIEdgeInsetsMake(7, 10, 7, 10));
    }];
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
    
    self.TextField.background = [UIImage imageNamed:@"搜索栏"];
    
    
    UIImageView *Searchimage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"查找简历"]];
    self.TextField.leftView=Searchimage;
    self.TextField.leftViewMode = UITextFieldViewModeUnlessEditing;
    
    self.TextField.userInteractionEnabled = YES;
    
    self.TextField.textColor = [UIColor whiteColor];
    
    self.TextField.clearsOnBeginEditing = YES;
    
    self.TextField.font = [UIFont fontWithName:@"Helvetica-Bold"size:16];
}

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
   
    return YES;
    
}

//点击空白收起键盘、
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.TextField resignFirstResponder];
    
    
}

//设置TableView
-(void)setupTableV
{
    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 113, self.view.bounds.size.width, self.view.bounds.size.height)];
    _tableV = tableV;
    
    tableV.delegate = self;
    tableV.dataSource = self;
    
    tableV.rowHeight = 49;
    
    [self.view addSubview:tableV];
}


#pragma mark - Table view data source


//几个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_myArray count];
}

//自定义cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *RunameID = @"RunameCell";
    
    PXRunameCell *cell = [tableView dequeueReusableCellWithIdentifier:RunameID];
    
    if (cell == nil) {
        cell = [[PXRunameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RunameID target:self action:@selector(EditBtnClick) target2:self action2:@selector(DeleteBtnClick)];
    }

    
    return cell;
}

//删除按钮点击事件
-(void)DeleteBtnClick
{
    NSLog(@"删除简历");

    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    
    [_myArray removeObjectAtIndex:indexPath.row];
    
    [_tableV deleteRowsAtIndexPaths:@[indexPath]  withRowAnimation:UITableViewRowAnimationFade];
    
    [_tableV reloadData];
}

//编辑按钮点击事件
-(void)EditBtnClick
{
    PXEditRunameViewController *EditV = [[PXEditRunameViewController alloc]init];
    
    [self.navigationController pushViewController:EditV animated:YES];
}

//底部视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 70;
}

//设置底部视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footerV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    
    
//    UIButton *AddBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 300, 49)];
    
    UIButton *AddBtn = [UIButton new];
    
#warning TODO - 图片需修改
    [AddBtn setBackgroundImage:[UIImage imageNamed:@"添加简历"] forState:UIControlStateNormal];
    
    [AddBtn setTitle:@"添加简历" forState:UIControlStateNormal];
    
    [AddBtn addTarget:self action:@selector(AddBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [footerV addSubview:AddBtn];
    
    [AddBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(footerV).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    return footerV;
}

//AddBtn点击事件
-(void)AddBtnClick
{
    PXAddRunameViewController *AddV = [[PXAddRunameViewController alloc]init];
    
    [self.navigationController pushViewController:AddV animated:YES];

}






@end
