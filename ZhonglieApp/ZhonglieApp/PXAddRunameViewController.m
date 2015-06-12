//
//  PXAddRunameViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/12.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXAddRunameViewController.h"
#import "UIBarButtonItem+Extension.h"


@interface PXAddRunameViewController ()<UITextFieldDelegate>

@property(nonatomic,strong) UITextField *TextField;

@end

@implementation PXAddRunameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"简历推荐";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(BackBtnClick)];
    
    [self setupHeaderV];
    
    [self setupScrollV];
}


//加载ScrollView内容
-(void)setupScrollV
{

}

//加载头部搜索栏
-(void)setupHeaderV
{
    UIView *HeaderV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 50)];
    
    HeaderV.backgroundColor = [UIColor grayColor];
    
    UITextField *TextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, 300, 33)];
    
    _TextField = TextField;
    
    TextField.delegate = self;
    
    TextField.background = [UIImage imageNamed:@"searchBarBack"];
    
    [self setupTextFiel];
    
    
    [HeaderV addSubview:TextField];
    [self.view addSubview:HeaderV];
}

//TextField细节处理
-(void)setupTextFiel
{
    
    self.TextField.borderStyle = UITextBorderStyleNone;
    self.TextField.keyboardType = UIKeyboardTypeDefault;
    self.TextField.delegate = self;
    
    self.TextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.TextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.TextField.returnKeyType = UIReturnKeySearch;
    
    self.TextField.background = [UIImage imageNamed:@"searchBarBack"];
    
    
    UIImageView *Searchimage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"查找职位"]];
    self.TextField.leftView=Searchimage;
    self.TextField.leftViewMode = UITextFieldViewModeUnlessEditing;
    
    self.TextField.userInteractionEnabled = YES;
    
    self.TextField.textColor = [UIColor whiteColor];
    
    self.TextField.clearsOnBeginEditing = YES;
    
    self.TextField.font = [UIFont fontWithName:@"Helvetica-Bold"size:16];
}

//点击搜索键收回键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    textField.text = @"";
    
    return YES;
}

//开始编辑时隐藏查找职位图片
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    self.TextField.leftViewMode = UITextFieldViewModeNever;
}


//导航栏返回键点击事件
-(void)BackBtnClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
