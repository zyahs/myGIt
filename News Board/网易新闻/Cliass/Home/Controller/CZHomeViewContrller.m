//
//  CZHomeViewContrller.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZHomeViewContrller.h"
#import "CZChannelModle.h"
#import "CZChannelLabel.h"
#import "UIView+Frame.h"
@interface CZHomeViewContrller ()
/**
 *  频道的滚动标签
 */
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;




@end
@implementation CZHomeViewContrller

-(void)viewDidLoad
{
    [self setChannelLabel];
}
/**
 *  创建频道标签
 */
- (void)setChannelLabel
{
    NSArray *channels = [CZChannelModle channels];
    //遍历去创建 channel
    CGFloat channelLabelW = 80;
    CGFloat channelLabelH  = self.channelScrollView.h;
    CGFloat channelLabelY = 0;
//    CGFloat channelLabelX = 0;
    for ( NSInteger i = 0 ; i < channels.count ; i++) {
        CZChannelLabel *channelLabel = [[CZChannelLabel alloc]init];
        
        //1.1设置 frame
        channelLabel.frame = CGRectMake(channelLabelW * i, channelLabelY, channelLabelW, channelLabelH);
        
        //1.2.设置文字
        channelLabel.text = [channels[i] tname];
        
        //1.3添加到父控件
        [self.channelScrollView addSubview:channelLabel];
        
        
    }
    //3 设置 ContentSize
    self.channelScrollView.contentSize = CGSizeMake(channelLabelW *channels.count, 0);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}


















@end
