//
//  PXHistoryCell.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/9.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXHistoryCell.h"

@implementation PXHistoryCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  初始化cell
         */
        
        self = [[NSBundle mainBundle] loadNibNamed:@"PXHistoryCell" owner:nil options:nil].firstObject;
    }
    return self;
}


@end
