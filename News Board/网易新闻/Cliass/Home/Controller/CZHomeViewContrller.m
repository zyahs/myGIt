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
#import "CZContentCell.h"
@interface CZHomeViewContrller ()<UICollectionViewDataSource>
/**
 *  频道的滚动标签
 */
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;
/**
 *  显示新闻内容的 CollectionView
 */
@property (weak, nonatomic) IBOutlet UICollectionView *contentCollectionView;

/**
 *  模型数组
 */
@property (nonatomic,strong)NSArray *channles;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *contentFlowLayout;

@end
@implementation CZHomeViewContrller

-(void)viewDidLoad
{
    [self setChannelLabel];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置 cel 的大小
    [self setContentCellSize];
}
/**
 *  创建频道标签
 */
- (void)setChannelLabel
{
     self.channles = [CZChannelModle channels];
    //遍历去创建 channel
    CGFloat channelLabelW = 80;
    CGFloat channelLabelH  = self.channelScrollView.h;
    CGFloat channelLabelY = 0;
//    CGFloat channelLabelX = 0;
    for ( NSInteger i = 0 ; i < self.channles.count ; i++) {
        CZChannelLabel *channelLabel = [[CZChannelLabel alloc]init];
        
        //1.1设置 frame
        channelLabel.frame = CGRectMake(channelLabelW * i, channelLabelY, channelLabelW, channelLabelH);
        
        //1.2.设置文字
        channelLabel.text = [self.channles[i] tname];
        
        //1.3添加到父控件
        [self.channelScrollView addSubview:channelLabel];
    }
    //3 设置 ContentSize
    self.channelScrollView.contentSize = CGSizeMake(channelLabelW *self.channles.count, 0);
    

    
}


#pragma mark - contentCollectionView数据源


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.channles.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CZContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ContentCell" forIndexPath:indexPath];

    CZChannelModle *channel = self.channles[indexPath.item];
    cell.channel = channel;
    
    return cell;
}


- (void)setContentCellSize
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height - 64 - self.channelScrollView.h;
    self.contentFlowLayout.itemSize = CGSizeMake(width, height);

}







@end
