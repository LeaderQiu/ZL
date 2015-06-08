//
//  PXRuname2ViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/8.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXRuname2ViewController.h"
#import "PXRuname2Cell.h"
#import "UIBarButtonItem+Extension.h"
#import "PXDetailViewController.h"



@interface PXRuname2ViewController ()<UITextFieldDelegate,UITableViewDataSource,UITabBarDelegate>

@property(nonatomic,strong) UITextField *TextField;

@end

@implementation PXRuname2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image: [UIImage imageNamed:@"runame"]selectedImage:[UIImage imageNamed:@"runame-hover"]];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"简历推荐";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(BackClickBtn)];
    
    
    [self setupFirstV];
    
    [self setupTableV];
    
    
}

//点击返回键
-(void)BackClickBtn
{
//     PXDetailViewController *DetailVC = [[PXDetailViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController popToRootViewControllerAnimated:YES];
//    [self.navigationController popToViewController:DetailVC animated:YES];
}

-(void)setupFirstV
{
    UIView *FirstV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 49)];
    
    [FirstV setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"搜索栏Cell背景"]]];
    
    //    UIImageView *backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"搜索栏Cell背景"]];
    //    backImage.frame = CGRectMake(0, 64, 320, 48) ;
    //
    //    [FirstV addSubview:backImage];
    
    //添加TextFiel
    UITextField *TextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 7, 300, 35)];
    
    _TextField = TextField;
    
    [self setupTextFiel];
    [FirstV addSubview:TextField];
    
    [self.view addSubview:FirstV];
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
    
    self.TextField.textColor = [UIColor blackColor];
    
    self.TextField.clearsOnBeginEditing = YES;
    
    self.TextField.font = [UIFont fontWithName:@"Helvetica-Bold"size:16];
}

//开始编辑时隐藏查找职位图片
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    self.TextField.leftViewMode = UITextFieldViewModeNever;
    
    //    [self setupSearchHistory];
    
}

//设置TableView
-(void)setupTableV
{
    
    self.tableView.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height) ;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 49;
}


#pragma mark - Table view data source

//几个cell

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 8;
}

//设置cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *RunameID = @"Runame2Cell";
    
    PXRuname2Cell *cell = [tableView dequeueReusableCellWithIdentifier:RunameID];
    
    if (cell == nil) {
        cell = [[PXRuname2Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:RunameID];
    }
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
