//
//  CZNews.h
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^FinishedBlock) (NSArray * newList);
@interface CZNews : NSObject
// 标题
@property (nonatomic, copy) NSString *title;
// 摘要
@property (nonatomic, copy) NSString *digest;
// 图片
@property (nonatomic, copy) NSString *imgsrc;
// 跟贴数
@property (nonatomic, assign) int replyCount;
// 多张配图
@property (nonatomic, strong) NSArray *imgextra;
// 大图标记
@property (nonatomic, assign) BOOL imgType;

/**
 *  定义类方法
 电泳该方法,传入一个频道的 urlStr,返回一个对应频道的新闻类型的数组
 */

+ (void)newsListWithURLString:(NSString *)URLString finishedBlock:(FinishedBlock)finishedBlock;
@end

