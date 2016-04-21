//
//  CZNewsCell.m
//  网易新闻
//
//  Created by 飞奔的羊 on 16/4/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "CZNewsCell.h"
#import <UIImageView+AFNetworking.h>
#import "CZNews.h"
@interface CZNewsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titalLabel;
@property (weak, nonatomic) IBOutlet UILabel *digestLabel;

@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *extraImageViews;


@end
@implementation CZNewsCell

-(void)setNews:(CZNews *)news
{
    _news =news;
    //给 image 显示
//    [self.iconImageView setImage:[NSURL URLWithString:news.imgsrc]];
    
    [self.iconImageView setImageWithURL:[NSURL URLWithString:news.imgsrc]];
    
//  [self.iconImageView setImage  [UIImage safeImageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:news.imgsrc]]]];
    self.titalLabel.text = news.title;
    self.digestLabel.text = news.digest;
    self.replyLabel.text = [NSString stringWithFormat:@"%d",news.replyCount];
    //处理多张图的情况
    if (news.imgextra.count == 2) {
        NSArray *dictArray= news.imgextra;
        for ( NSInteger i = 0 ; i < dictArray.count ; i++) {
            //1.取出我们的imgextra每一个 item
            UIImageView *imageView =self.extraImageViews[i];
            //取出字典
            NSDictionary *dict = dictArray[i];
            //取出每一个图片的地址
            NSString *imageSrcString= dict[@"imgsrc"];
            [imageView setImageWithURL:[NSURL URLWithString:imageSrcString]];
        }
    }

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
