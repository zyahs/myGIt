//
//  CZCycles.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZCycles.h"
#import "CZNetWorkTool.h"
@implementation CZCycles
+ (instancetype)cycleWithDict: (NSDictionary *)dict
{
    id obj = [[self alloc]init];
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
    
    

}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
}
+ (void)cycleWithURLString:(NSString *)URLSring With:(FinishedBlock)finishedBlock
{
    [[CZNetWorkTool shareNetWorkTool] objectWithURLString:URLSring completeBlock:^(id result) {
        if ([result isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict = (NSDictionary *)result;
            
            NSArray *dictArray = dict[@"headline_ad"];
            
            NSMutableArray *cycles = [NSMutableArray array];
            for (NSDictionary *dict in dictArray) {
                CZCycles *cycle =[CZCycles cycleWithDict:dict];
                [cycles addObject:cycle];
            }
            //通过 Block 胡迟缓控制器
            if (finishedBlock != nil) {
                finishedBlock(cycles.copy);
            }
            
        }
        
        
    }];

}
@end
