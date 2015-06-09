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
#import "PXSearchHistoryCell.h"
#import "PXSearchCell.h"
#import "PXDetailViewController.h"

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

@property(nonatomic,strong) NSArray *SearchText2;


@end

@implementation PXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBarHidden = YES;
    
//    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], nil] forState:UIControlStateNormal];
//    
//    [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], nil] forState:UIControlStateHighlighted];

    
    
    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image: [UIImage imageNamed:@"众猎"]selectedImage:[UIImage imageNamed:@"众猎-hover"]];
    
    self.navigationController.tabBarItem.title= @"众猎";
    
    

    
     
  
    [self setupHeaderView];
    
    //创建首页岗位列表tableView
    UITableView *MainTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 170, [UIScreen mainScreen].bounds.size.width, 450)];
    
    //设置tableView数据源代理
    MainTableV.dataSource = self;
    MainTableV.delegate = self;
     _MainTableV = MainTableV;
    
    [self.view addSubview:MainTableV];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回键"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    UITableView *SearchHistory = [[UITableView alloc]initWithFrame:CGRectMake(0,170 ,self.view.bounds.size.width, 10)];
    _SearchHistory = SearchHistory;

    
    
}

//点击空白收起键盘、收起SearchHistoryView
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.TextField resignFirstResponder];
    
    self.SearchHistory.hidden = YES;
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
    
    //获取用户输入的内容
    
    NSString *SearchText = [textField text];
    
    
    _SearchText =SearchText;

    
    NSLog(@"用户输入******%@",SearchText);
    
    [[NSUserDefaults standardUserDefaults]setObject:SearchText forKey:@"textFieldKey"];
    

  
    
    
    
    
    
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
    UITableView *SearchHistory = [[UITableView alloc]initWithFrame:CGRectMake(0,170 ,self.view.bounds.size.width, 180)];
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
    self.SearchHistory.hidden = YES;
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
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([tableView isEqual:_SearchHistory]) {
        
        if (indexPath.row == 1) {
            
            UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 100)];
            backV.backgroundColor = [UIColor yellowColor];
            
            self.SearchHistory.sectionIndexBackgroundColor = [UIColor yellowColor];
            
            
            static NSString *searchHistoryID = @"searchHistoryCell";
            
            PXSearchHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:searchHistoryID];
            
            if (cell == nil) {
                
                cell = [[PXSearchHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchHistoryID];
            }
            
            return cell;
        } else {
            if (indexPath.row == 0) {
                static NSString *searchID = @"searchCell";
                
                PXSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:searchID];
                
                if (cell == nil) {
                    
                    cell = [[PXSearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchID];
                }
                
                cell.model = @"热门搜索";
                
                return cell;
            }
            if (indexPath.row == 2) {
                static NSString *searchID = @"searchCell";
                
                PXSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:searchID];
                
                if (cell == nil) {
                    
                    cell = [[PXSearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchID];
                }
                
                cell.model = @"搜索历史";
                
                return cell;
            }
            if (indexPath.row == 3) {
                static NSString *searchID = @"searchCell";
                
                PXSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:searchID];
                
                if (cell == nil) {
                    
                    cell = [[PXSearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchID];
                }
                
                
                cell.model = [[NSUserDefaults standardUserDefaults] objectForKey:@"textFieldKey"];
                
                return cell;
            }

            
            static NSString *searchID = @"searchCell";
            
            PXSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:searchID];
            
            if (cell == nil) {
                
                cell = [[PXSearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchID];
            }
            
            cell.model = @" ";
            
            return cell;
        }
        
    } else {
        
        static NSString *mainID = @"PXMainCell";
        
        PXMainCell *cell = [tableView dequeueReusableCellWithIdentifier:mainID];
        
        if (cell == nil) {
            cell = [[PXMainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mainID];
        }
        return cell;
    }
    
    
    

    
}

    
    
    



#pragma mark - TableView代理方法

//点击cell事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:_MainTableV]) {
        PXDetailViewController *DetailVC = [[PXDetailViewController alloc]initWithStyle:UITableViewStyleGrouped];
        
        [self.navigationController pushViewController:DetailVC animated:YES];
        
        NSLog(@"%zd", indexPath.row);

    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 96.0;
}

//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:self.SearchHistory]) {
        if(indexPath.row == 1){
            return 100;
        }else{
            return 48.0;
        }
        
    }
    
    return 96.0;
}



@end
