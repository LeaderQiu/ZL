//
//  PXCityViewController.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/3.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXCityViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "UIColor+SYExtension.h"
#import "PXDataTools.h"
#import "PXCityGroup.h"

@interface PXCityViewController ()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation PXCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = @"选择城市";
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"返回键" highImage:@"返回键" target:self action:@selector(BackClickBtn)];
    

    //创建城市TableView列表
    self.view.backgroundColor = [UIColor colorWithRGB:0xe3e3e3];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.rowHeight = 44;
    
    
    
}

//导航栏返回键
-(void)BackClickBtn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}



#pragma mark - Tableiew数据源
//设置有几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [PXDataTools cityGroups].count;
}

//每组有几个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    PXCityGroup *group = [PXDataTools cityGroups][section];
    
    return group.cities.count;
}
//
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    static NSString *ID = @"city";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 设置城市名称
    PXCityGroup *cityGroup = [PXDataTools cityGroups][indexPath.section];
    cell.textLabel.text = cityGroup.cities[indexPath.row];
    
    return cell;
    
    
    
    
}

#pragma mark - TableView代理

//每个组组名
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    PXCityGroup *cityGroup = [PXDataTools cityGroups][section];
    
    NSString *title = cityGroup.title;
    
    
    
    return cityGroup.title;
}

//检索栏
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray *titles = [[PXDataTools cityGroups] valueForKeyPath:@"title"];
    
    
    
    return titles;
}

//设置组底部
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
        if (0 == section) {
               return @"高端大气上档次";
        }else{
            return nil;
   
        }
}

//section头部视图
- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView* view = [[UIView alloc] initWithFrame: CGRectMake(0.0f, 0.0f, 640.0f, 0.0f)];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    }
    return nil;
}


//自定义标头视图
-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PXCityGroup *cityGroup = [PXDataTools cityGroups][section];
    
    
    NSString *sectionTitle = cityGroup.title;
    
    sectionTitle
    
    
    
    // Create header view and add label as a subview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10.0,
                                                            0.0,
                                                            320.0,
                                                            100.0)];
    view.backgroundColor = [UIColor lightGrayColor];
    
    
    // Create label with section title
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(5.0,
                             12.0,
                             284.0,
                             24.0);
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:16.0];
    label.text = sectionTitle;
    label.backgroundColor = [UIColor clearColor];
    
    [view addSubview:label];
    
    return view;
    
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
