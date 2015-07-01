//
//  PXSearchHistoryCell.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/4.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXSearchHistoryCell.h"
#import "PXSearchLabel.h"

@interface PXSearchHistoryCell ()
@property (weak, nonatomic) IBOutlet UIButton *Btn1;
@property (weak, nonatomic) IBOutlet UIButton *Btn2;
@property (weak, nonatomic) IBOutlet UIButton *Btn3;
@property (weak, nonatomic) IBOutlet UIButton *Btn4;
@property (weak, nonatomic) IBOutlet UIButton *Btn5;
@property (weak, nonatomic) IBOutlet UIButton *Btn6;

/**存放的模型数组*/
@property(nonatomic,strong) NSMutableArray *dataArray1;

@end




@implementation PXSearchHistoryCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  初始化cell
         *
         *  @return
         */

        
        
        
        
        //加载xib
        self = [[NSBundle mainBundle] loadNibNamed:@"PXSearchHistoryCell" owner:nil options:nil].firstObject;
        
        //设置为不可选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)setSearchLabel:(PXSearchLabel *)searchLabel
{
    [self.Btn1 setTitle:searchLabel.title forState:UIControlStateNormal];
}

@end
