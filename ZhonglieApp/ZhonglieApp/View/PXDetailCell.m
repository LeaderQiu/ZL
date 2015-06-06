//
//  PXDetailCell.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/6.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXDetailCell.h"

@implementation PXDetailCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  初始化cell
         *
         *  @return <#return value description#>
         */
        
        self = [[NSBundle mainBundle] loadNibNamed:@"PXDetailCell" owner:nil options:nil].firstObject;
    }
    
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
