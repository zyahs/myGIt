//
//  CZNews.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZNews.h"
#import <AFNetworking.h>
#import "CZNetWorkTool.h"
@implementation CZNews
+ (void)newsListWithURLString:(NSString *)URLString finishedBlock:(FinishedBlock)finishedBlock
{

//    [[AFHTTPSessionManager manager] GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//    
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//    
//    }];

    [[CZNetWorkTool shareNetWorkTool] objectWithURLString:URLString completeBlock:^(id result) {
        
//        NSLog(@"%@",result);
        NSMutableArray *nesList =[NSMutableArray array];
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = (NSDictionary *)result;
            
        //1.取出字典里的 key
            /**
             *  对 key 的集合进行迭代,如果只有一个 key 用这个好
             */
//            NSString *key = dict.keyEnumerator.nextObject;
            
            NSString *key = [dict.allKeys lastObject];
            //2.通过 key 取出字典数组
            NSArray *array = dict[key];
//            NSLog(@"%@",key);
            
            for (NSDictionary *dict in array) {
                CZNews *news = [CZNews newsWithDict:dict];
             
                [nesList addObject:news];
            }
            
        }
        if (finishedBlock) {
            finishedBlock(nesList.copy);
        }
    }];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}

+ (instancetype)newsWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
    
}



















@end
