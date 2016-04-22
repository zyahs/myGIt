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
@interface CZHomeViewContrller ()<UICollectionViewDataSource,UICollectionViewDelegate>
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
/**
 *  控件数组
 */
@property (nonatomic,strong) NSMutableArray *channelLabels;
/**
 *  当前选中的 Label
 */
@property (nonatomic,weak)CZChannelLabel *currentSelectLabel;
@end
@implementation CZHomeViewContrller
- (NSMutableArray *)channelLabels
{
    if (!_channelLabels) {
        _channelLabels = [NSMutableArray array];
    }

    return _channelLabels;
}
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
        
        
        if (i == 0) {
            channelLabel.scale = 1.0;
        }
        //1.1设置 frame
        channelLabel.frame = CGRectMake(channelLabelW * i, channelLabelY, channelLabelW, channelLabelH);
        
        //1.2.设置文字
        channelLabel.text = [self.channles[i] tname];
        
        //1.3添加到父控件
        [self.channelScrollView addSubview:channelLabel];
        
        //1.4添加 tag 值
        channelLabel.tag = i;
        //1.5 添加手势
//        UITapGestureRecognizer *tap = [UITapGestureRecognizer alloc]initWithTarget:<#(nullable id)#> action:<#(nullable SEL)#>
        [channelLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(channelClick:)]];
        //开启交互
        channelLabel.userInteractionEnabled = YES;
        //1.6 把刚刚创建出来的 chanlabel 添加到控件数组
        [self.channelLabels addObject:channelLabel];
        
        
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

#pragma mark - 上下联动的方法
/**
 *  调整上面的频道标签,变红变大
 */
- (void)lastMethop
{
    CGFloat needScrollOffsetX = self.currentSelectLabel.center.x - self.channelScrollView.bounds.size.width *0.5;
    CGFloat maxAllowScrollOffsetX = self.channelScrollView.contentSize.width - self.channelScrollView.bounds.size.width;
    if (needScrollOffsetX < 0) {
        needScrollOffsetX = 0;
    }
    if (needScrollOffsetX > maxAllowScrollOffsetX) {
        needScrollOffsetX = maxAllowScrollOffsetX;
    }
    
    [self.channelScrollView setContentOffset:CGPointMake(needScrollOffsetX, 0) animated:YES];
    //重置所有的 channeLabe 的选中状态
    for (CZChannelLabel *channeLaeble in self.channelLabels) {
        if (channeLaeble == self.currentSelectLabel) {
            channeLaeble.scale = 1.0;
        }else
        {
            channeLaeble.scale =0.0;
        }
    }

}

- (void)channelClick:(UITapGestureRecognizer *)recognizer
{
    CZChannelLabel *channeLabel = (CZChannelLabel *)recognizer.view;
//    NSLog(@"sss");
    //计算应该滚动多少
    self.currentSelectLabel = channeLabel;
    //调用最终的方法
    [self lastMethop];
    //让下面的显示新闻的 collection 滚动
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:channeLabel.tag inSection:0];
    [self.contentCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}
/**
 *  z只哎哟 collection 一滚动就调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //1.计算滚动的偏移量
    CGFloat value = scrollView.contentOffset.x / scrollView.bounds.size.width;
    //处理在最左边还往右滚动
    if (value < 0 || self.channelLabels.count - 1) {
        return;
    }
    //2.计算当前滚动到了第几页
    int currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    //3.获取右边的缩放比率
    CGFloat rightScale = value - currentPage;
    //4.左边的缩放比率
    CGFloat leftScale = 1 - rightScale;
    //5.左边的索引
    int leftIndex = currentPage;
    //6.右边的索引
    int rightIndex = leftIndex + 1;
    //7.取出左边的 channelLabel
    CZChannelLabel *leftLabel = self.channelLabels[leftIndex];
    leftLabel.scale = leftScale;
    //8.取出右边的 channelLabel
    if (rightIndex < self.channelLabels.count) {
        CZChannelLabel *rightLabel = self.channelLabels[rightIndex];
        rightLabel.scale = rightScale;
    }
    
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int currentPage = scrollView.contentOffset.x/scrollView.bounds.size.width;
    
    self.currentSelectLabel = self.channelLabels[currentPage];
    
    [self lastMethop];
    
}































@end
