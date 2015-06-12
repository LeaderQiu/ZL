//
//  PXRuname2Cell.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/8.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXRunameCell.h"

@interface PXRunameCell () 
@property (weak, nonatomic) IBOutlet UIButton *EditBtn;

@end

@implementation PXRunameCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier target:(id)target action:(SEL)action
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  初始化cell
         */
        UIView *backV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 49)];
        
        backV.backgroundColor = [UIColor clearColor];
        self.selectedBackgroundView =backV;
        
        self = [[NSBundle mainBundle] loadNibNamed:@"PXRunameCell" owner:nil options:nil].firstObject;
        
        //设置为不可选中
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [_EditBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}

@end
