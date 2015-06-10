//
//  PXUserTableViewCell.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/10.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXUserTableViewCell.h"

@implementation PXUserTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  初始化cell
         */
        self = [[NSBundle mainBundle]loadNibNamed:@"PXUserCenterView" owner:nil options:nil].firstObject;
    }
    return self;
}

@end
