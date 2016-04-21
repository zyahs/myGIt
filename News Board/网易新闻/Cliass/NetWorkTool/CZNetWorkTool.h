//
//  CZNetWorkTool.h
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
typedef void(^CompleteBlock)(id result);

@interface CZNetWorkTool : AFHTTPSessionManager
/**
 *  实现单例
 *
 *  @return <#return value description#>
 */
+ (instancetype)shareNetWorkTool;

/**
 * 供所有模型调用的
 URLString
 */

- (void)objectWithURLString:(NSString *)URLString completeBlock:(CompleteBlock)completeBlock;


@end
