//
//  CZContentCell.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZContentCell.h"
#import "CZNewsTableViewController.h"
#import "CZChannelModle.h"
@interface CZContentCell ()
/**
 *
 */
@property (nonatomic,strong)CZNewsTableViewController *newsViewController;



@end
@implementation CZContentCell
/**
 *  这个方法不能拿到 frame
 *
 *  @param aDecoder
 *
 *  @return
 */
//- (instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self = [super initWithCoder:aDecoder]) {
//        
//    }
//
//    return self;
//}

- (void)awakeFromNib
{
self.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];

    //加载 TableViewController
    UIStoryboard *newsStoyrBoard = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    //从 storyBoard 中加载控制器
    self.newsViewController =[newsStoyrBoard instantiateInitialViewController];
    //将 self.newsViewController 的 Tableview 加到 contentVIew
    [self.contentView addSubview:self.newsViewController.tableView];
    //给添加上去的 self.newsViewController.tableView 设置 frame
    
    self.newsViewController.tableView.frame = self.contentView.bounds;
    
    
}


- (void)setChannel:(CZChannelModle *)channel
{
    _channel = channel;
    self.newsViewController.tidURLString = channel.tidURLString;



}


























@end
