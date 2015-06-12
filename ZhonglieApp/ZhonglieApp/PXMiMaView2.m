//
//  PXMiMaView2.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/12.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXMiMaView2.h"

@interface PXMiMaView2 ()
@property (weak, nonatomic) IBOutlet UIButton *QueRen;

@end

@implementation PXMiMaView2

-(instancetype)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action
{
    if (self = [super initWithFrame:frame]) {
        /**
         *  初始化xib
         */
        self = [[NSBundle mainBundle] loadNibNamed:@"PXMiMaView2" owner:nil options:nil].firstObject;
        
        [_QueRen addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end
