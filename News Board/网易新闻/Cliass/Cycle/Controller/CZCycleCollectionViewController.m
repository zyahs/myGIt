//
//  CZCycleCollectionViewController.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZCycleCollectionViewController.h"
#import "CZCycles.h"
#import "CZCycleCollectionViewCell.h"
#import <TAPageControl.h>
#import <Masonry.h>
#define kMinSection 3
@interface CZCycleCollectionViewController ()
/**
 *  <#Description#>
 */
@property (nonatomic,strong)NSArray *innerCycles;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *cycleFlowLayout;

/**
 *  <#Description#>
 */
@property (nonatomic,weak)TAPageControl *pageControl;
@end

@implementation CZCycleCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cycleFlowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 250);
    [self loadData];
    
    
    [self setUpPageController];

}


- (void)setUpPageController
{
    //创建
    TAPageControl *pageControl = [[TAPageControl alloc]init];
    pageControl.dotSize = CGSizeMake(4, 4);
    //加入到父控件
    [self.view addSubview:pageControl];
    
    //自动布局
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@30);
        make.trailing.equalTo(self.view).offset(0);
         make.bottom.equalTo(self.view).offset(0);
        
    }];
    self.pageControl = pageControl;
    
}
- (void)loadData
{
__weak typeof (self) weakSelf = self;
    [CZCycles cycleWithURLString:@"ad/headline/0-4.html" With:^(NSArray *cycles) {
        weakSelf.innerCycles = cycles;
        weakSelf.pageControl.numberOfPages = cycles.count;
          [weakSelf.collectionView reloadData];
//        NSLog(@"%@",cycles);
        
        //滚动到中间那组
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:kMinSection/2];
        [weakSelf.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition: UICollectionViewScrollPositionNone  animated:NO];
        
    }];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return kMinSection;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return self.innerCycles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *  reuseIdentifier = @"Cell";

    CZCycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.cycles =self.innerCycles[indexPath.row];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//计算滚动到第几页
    int currentPage = (int)(scrollView.contentOffset.x / scrollView.bounds.size.width) %self.innerCycles.count;
//回到
    NSIndexPath *currentIndexPath = [NSIndexPath indexPathForItem:currentPage inSection:kMinSection/2];
  [self.collectionView scrollToItemAtIndexPath:currentIndexPath atScrollPosition: UICollectionViewScrollPositionNone  animated:NO];
    
    self.pageControl.currentPage =currentPage;
}
/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
