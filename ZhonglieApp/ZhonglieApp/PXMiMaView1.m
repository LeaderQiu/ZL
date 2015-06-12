//
//  PXMiMaView1.m
//  ZhonglieApp
//
//  Created by 邱思雨 on 15/6/12.
//  Copyright (c) 2015年 PX. All rights reserved.
//

#import "PXMiMaView1.h"

@interface PXMiMaView1 ()
@property (weak, nonatomic) IBOutlet UIButton *NextBtn;

@end

@implementation PXMiMaView1

-(instancetype)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action
{

    if (self = [super initWithFrame:frame]) {
        /**
         *  加载xib
         */
        self = [[NSBundle mainBundle] loadNibNamed:@"PXMiMaView1" owner:nil options:nil].firstObject;
        
        [_NextBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

@end
