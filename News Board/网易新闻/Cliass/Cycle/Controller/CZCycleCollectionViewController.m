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
@interface CZCycleCollectionViewController ()
/**
 *  <#Description#>
 */
@property (nonatomic,strong)NSArray *innerCycles;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *cycleFlowLayout;
@end

@implementation CZCycleCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cycleFlowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 250);
    [self loadData];

}

- (void)loadData
{
__weak typeof (self) weakSelf = self;
    [CZCycles cycleWithURLString:@"ad/headline/0-4.html" With:^(NSArray *cycles) {
        weakSelf.innerCycles = cycles;
          [weakSelf.collectionView reloadData];
        NSLog(@"%@",cycles);
        
    }];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}


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
