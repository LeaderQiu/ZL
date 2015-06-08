//
//  PXRunameCell.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/8.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXRunameCell.h"

@implementation PXRunameCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  初始化cell
         */
        
        self = [[NSBundle mainBundle] loadNibNamed:@"PXRunameCell" owner:nil options:nil].firstObject;
    }
    return self;
}


@end
