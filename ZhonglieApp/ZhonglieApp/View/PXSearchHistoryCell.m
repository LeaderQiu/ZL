//
//  PXSearchHistoryCell.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/4.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXSearchHistoryCell.h"

@implementation PXSearchHistoryCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  初始化cell
         *
         *  @return
         */
#warning TODO
        self.userInteractionEnabled = FALSE;
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        
        //加载xib
        self = [[NSBundle mainBundle] loadNibNamed:@"PXSearchHistoryCell" owner:nil options:nil].firstObject;
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
