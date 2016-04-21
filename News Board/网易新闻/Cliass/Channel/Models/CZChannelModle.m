//
//  CZChannelModle.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZChannelModle.h"

@implementation CZChannelModle
- (void)setTid:(NSString *)tid
{
    _tid = tid;
    //生成 tid 对应的 URLString
    //判断是否头条
    if ([tid isEqualToString:@"T1348647853363"]) {
        _tidURLString = @"";
    }
else
{
    _tidURLString = [NSString stringWithFormat:@"%@",_tid];

}

}

/**
 *  自爱单
 *
 *  @param dict <#dict description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)channelWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;

}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}

//- (NSString *)description
//{
////    return [NSString stringWithFormat:@"%@---%@",self.tid,self.tname];
//
//}

+ (NSArray *)channels
{
//1.找到 topic_news.json
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"topic_news.json" withExtension:nil];
    
    //2.将其通过 fileURL 转成二进制,转出来就是 JSON 二进制
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    //转成字典
    NSDictionary *fileDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];

    //4.通过 tList 获取到字典数组
    NSArray *dictArray =fileDict[@"tList"];

    //遍历数组,将里面的每一个字典转成模型,加入
    NSMutableArray *channels =[NSMutableArray array];
    
    for (NSDictionary *dict in dictArray) {
        //将 dict 转成 Channels
        
        CZChannelModle *channel = [CZChannelModle channelWithDict:dict];
        //加入可变数组
        [channels addObject:channel];
    }


//    NSLog(@"%@",channels);
    //6.对上面的 channels 排序
    [channels sortUsingComparator:^NSComparisonResult(CZChannelModle  *obj1, CZChannelModle *obj2) {
        return [obj1.tid compare:obj2.tid];
        
    }];


    return channels.copy;

}

















@end
