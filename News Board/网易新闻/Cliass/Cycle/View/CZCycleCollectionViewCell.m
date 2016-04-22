//
//  CZCycleCollectionViewCell.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZCycleCollectionViewCell.h"
#import "CZCycles.h"
#import <UIImageView+WebCache.h>
@interface CZCycleCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;


@end
@implementation CZCycleCollectionViewCell
- (void)setCycles:(CZCycles *)cycles
{
    _cycles =cycles;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:cycles.imgsrc]];
    
    self.titleLabel.text = cycles.title;


}
@end
