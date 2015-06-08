//
//  PXTableViewController.m
//  ZhonglieApp
//
//  Created by mukang on 15/5/25.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXRunameViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface PXRunameViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITextField *TextField;

@end

@implementation PXRunameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image: [UIImage imageNamed:@"runame"]selectedImage:[UIImage imageNamed:@"runame-hover"]];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"简历管理";
    
    [self setupFirstV];
    
    [self setupTableV];
    
    
}

-(void)setupFirstV
{
    UIView *FirstV = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 320, 49)];
    
    UIImageView *backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"搜索栏Cell背景"]];
    backImage.frame = CGRectMake(0, 64, 320, 48) ;
    
    [FirstV addSubview:backImage];
    
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
    
    self.TextField.textColor = [UIColor whiteColor];
    
    self.TextField.clearsOnBeginEditing = YES;
    
    self.TextField.font = [UIFont fontWithName:@"Helvetica-Bold"size:16];
}

-(void)setupTableV
{
    UITableView *tableV = [[UITableView alloc]initWithFrame:CGRectMake(0, 113, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [self.view addSubview:tableV];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
