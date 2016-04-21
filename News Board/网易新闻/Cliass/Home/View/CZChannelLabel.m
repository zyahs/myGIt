//
//  CZChannelLabel.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZChannelLabel.h"

@implementation CZChannelLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //1. 设置背景色
        self.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        
        self.textAlignment = UITextAlignmentCenter;
#pragma clang diagnostic pop
        
        self.font = [UIFont systemFontOfSize:20];
    }

    return self;
}

@end
