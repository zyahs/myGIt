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
//        self.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        
        self.textAlignment = UITextAlignmentCenter;
#pragma clang diagnostic pop
        self.scale = 0;
        self.font = [UIFont systemFontOfSize:20];
    }

    return self;
}

- (void)setScale:(float)scale
{
    _scale = scale;
    //改变颜色
    //白色是追不纯洁的颜色
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1.0];
    //字体
    CGFloat minScale = 0.8;
    //最终显示的缩放比例
    CGFloat lastScale = minScale + (1 - minScale)*scale;
    self.transform = CGAffineTransformMakeScale( lastScale, lastScale);



}
@end
