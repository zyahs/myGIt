//
//  CZNewsTableViewController.h
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZNewsTableViewController : UITableViewController
/**
 *  外界传来的 URL,对应频道.拿到之后去网络加载数据
 */
@property (nonatomic,copy) NSString *tidURLString;
@end
