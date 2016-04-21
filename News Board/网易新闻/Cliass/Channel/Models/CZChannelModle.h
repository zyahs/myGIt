//
//  CZChannelModle.h
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZChannelModle : NSObject
/**
 *  加载不同频道的数据
 */
@property (nonatomic,copy)NSString *tid;
/**
 *  显示频道的名称
 */
@property (nonatomic,copy)  NSString *tname;
/**
 *  返回所有频道的模型数组
 *
 *  @return <#return value description#>
 */
+ (NSArray *)channels;
@end
