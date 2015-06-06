//
//  PXDetailCell.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/6.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXDetailCell.h"

@interface PXDetailCell () 
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet UITextField *TextField;

@end

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

-(void)setDetailLable:(NSString *)DetailLable
{
    _DetailLable = DetailLable;
    
    _Label.text = DetailLable;
}

-(void)setDetailPlaceholder:(NSString *)DetailPlaceholder
{
    _DetailPlaceholder = DetailPlaceholder;
    
    _TextField.placeholder = DetailPlaceholder;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
