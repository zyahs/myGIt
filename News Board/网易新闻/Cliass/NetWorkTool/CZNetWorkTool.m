//
//  CZNetWorkTool.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZNetWorkTool.h"
#import <AFNetworking.h>
static NSString * const NewsBoardBaseURL = @"http://c.m.163.com/nc/";
@implementation CZNetWorkTool


static CZNetWorkTool *_instance;
+ (instancetype)shareNetWorkTool
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]initWithBaseURL:[NSURL URLWithString:NewsBoardBaseURL]];
    _instance.responseSerializer.acceptableContentTypes =    [_instance.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        
    });
    
    return _instance;

}
 - (void)objectWithURLString:(NSString *)URLString completeBlock:(CompleteBlock)completeBlock
{
    
   [self GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       if (completeBlock != nil) {
           completeBlock(responseObject);
       }
   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       NSLog(@"%@",error);
   }];

}
























@end
