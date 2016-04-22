//
//  CZCycles.h
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^FinishedBlock)(NSArray *cycles);
@interface CZCycles : NSObject
//标题
@property (nonatomic, copy) NSString *title;

//图片
@property (nonatomic, copy) NSString *imgsrc;

+ (void)cycleWithURLString:(NSString *)URLSring With:(FinishedBlock)finishedBlock;
@end
