//
//  PXRunameCell.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/8.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXRuname2Cell.h"

@implementation PXRuname2Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  初始化cell
         */
        
        self = [[NSBundle mainBundle] loadNibNamed:@"PXRuname2Cell" owner:nil options:nil].firstObject;
    }
    return self;
}


@end
