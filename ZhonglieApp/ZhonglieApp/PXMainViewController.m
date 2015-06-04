//
//  PXMainViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/5/25.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXMainViewController.h"
#import "PXMainCell.h"
#import "PXSearchViewController.h"
#import "PXCityViewController.h"

@interface PXMainViewController () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property(nonatomic,strong) UIImageView *LogoImageV;
@property(nonatomic,strong) UIImage *LogoImage;

@property(nonatomic,strong) UITableViewCell *MainTableViewCell;
@property(nonatomic,strong) UISearchBar *searchBar;
@property(nonatomic,strong) UITextField *TextField;
@property(nonatomic,strong) UIImageView *Searchimage;

@property(nonatomic,strong) UIImageView *headerV;

@property(nonatomic,strong) UITableView *SearchHistory;
@property(nonatomic,strong) UITableView *MainTableV;


@end

@implementation PXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image: [UIImage imageNamed:@"home"]selectedImage:[UIImage imageNamed:@"home-hover"]];
  
    [self setupHeaderView];
    
    //创建首页岗位列表tableView
    UITableView *MainTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 170, [UIScreen mainScreen].bounds.size.width, 450)];
    
    //设置tableView数据源代理
    MainTableV.dataSource = self;
    MainTableV.delegate = self;
     _MainTableV = MainTableV;
    
    [self.view addSubview:MainTableV];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UITableView *SearchHistory = [[UITableView alloc]initWithFrame:CGRectMake(0,170 ,self.view.bounds.size.width, 150)];
    _SearchHistory = SearchHistory;

    
    
}

#pragma mark - 加载头部

-(void)setupHeaderView
{
    //创建头部招牌View
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 176)];
    
    
    headerV.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:headerV];
    
    //设置头部招牌背景图
    UIImageView *headerImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"首页背景图"]];
    
    [headerV addSubview:headerImageV];
    
    //添加Logo
    UIImageView* LogoImageV=[[UIImageView alloc] initWithFrame:CGRectMake(40,50,64,63)];
    
    LogoImageV.image =[UIImage imageNamed:@"Logo"];
    
    [headerImageV addSubview:LogoImageV];
    
    //添加标语
    UIImageView *TextImageV = [[UIImageView alloc] initWithFrame:CGRectMake(130,65,158,45)];
    
    TextImageV.image = [UIImage imageNamed:@"标语"];
    
    [headerImageV addSubview:TextImageV];
    

     //添加TextFiel
     UITextField *TextField = [[UITextField alloc]initWithFrame:CGRectMake(130, 120, 160, 30)];
    
    _TextField = TextField;
    
    [self setupTextFiel];
    
    [headerV addSubview:TextField];


    
    
    
    //创建地区按钮
    UIButton *CityButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 125, 107, 32)];
    
    [CityButton setImage:[UIImage imageNamed:@"城市"] forState:UIControlStateNormal];
    
    [CityButton addTarget:self action:@selector(btnClickAction) forControlEvents:UIControlEventTouchUpInside];
    
    [headerV addSubview:CityButton];

   
}

//城市选择
-(void)btnClickAction
{
    PXCityViewController *CityVC = [[PXCityViewController alloc]initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:CityVC animated:YES];
}

//隐藏状态栏
-(BOOL)prefersStatusBarHidden
{
    return YES;
}

//跳转回来的页面再次隐藏状态栏
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
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
    
    self.TextField.background = [UIImage imageNamed:@"searchBarBack"];
    
    
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
    
    [self setupSearchHistory];
    
}

//点击键盘搜索键，收回键盘.***跳转页面****
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //隐藏搜索历史
    self.SearchHistory.hidden = YES;
    

    
    [textField resignFirstResponder];
    
    textField.text = @" ";
    
    PXSearchViewController *SearchVC = [[PXSearchViewController alloc] init] ;
    
//    [self presentViewController:SearchVC animated:YES completion:nil];
    
    [self.navigationController pushViewController:SearchVC animated:YES];
    
    return YES;
    
}

//加载搜索历史
-(void)setupSearchHistory
{
    UITableView *SearchHistory = [[UITableView alloc]initWithFrame:CGRectMake(0,170 ,self.view.bounds.size.width, 150)];
    _SearchHistory = SearchHistory;
    
    SearchHistory.delegate = self;
    SearchHistory.dataSource = self;
    
    
    SearchHistory.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:SearchHistory];
    
    self.SearchHistory.hidden = NO;
}



//结束编辑时显示查找职位图片
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.TextField.leftViewMode = UITextFieldViewModeUnlessEditing;
    
}

#pragma mark - TableView数据源

//cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([tableView isEqual:_MainTableV]) {
        return 10;
    }else if ([tableView isEqual:self.SearchHistory]){
        return 5;
    }
    return 10;
}

//自定义Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:_SearchHistory]) {
        
        UITableViewCell *searchHistoryCell = [[UITableViewCell alloc]init];
        searchHistoryCell.backgroundColor = [UIColor whiteColor];
      
        
        return searchHistoryCell;
    }
    
    static NSString *ID = @"PXMainCell";
    
    PXMainCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[PXMainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
    
    
//    //指定cellIdentifier为自定义的cell
//    static NSString *CellIdentifier = @"TableViewCell";
//    //自定义cell类
//    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        //通过xib的名称加载自定义的cell
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] lastObject];
//    }
//    
//    //添加测试数据
//    cell.titleLabel.text = [tableData objectAtIndex:indexPath.row];
//    cell.content.text = @"这是一些测试数据";
//    //测试图片
//    cell.iamge.image = [UIImage imageNamed:@"testImage.jpg"];
//    return cell;
    

    
    
    
}


#pragma mark - TableView代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"%zd", indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 96.0;
}

//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:self.SearchHistory]) {
        return 48.0;
    }
    
    return 96.0;
}


@end
