//
//  NewsEntityFrame.m
//  XidianInfo
//
//  Created by Pasco on 16/3/6.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "NewsEntityFrame.h"
#import "NewsEntityModel.h"

//标题、时间、浏览次数的字体
#define kTitleFont [UIFont systemFontOfSize:17.0]
#define kTimeFont [UIFont systemFontOfSize:12.0]
#define kViewCountFont [UIFont systemFontOfSize:12.0]

@implementation NewsEntityFrame

/**
 *  手动实现setNews方法，顺便把每个控件的frame也计算出来
 *
 */
- (void)setNews:(NewsEntityModel *)news {
    _news = news;
    
    CGRect titleLabelRect = [news.newsTitle boundingRectWithSize:CGSizeMake(kScreenWidth - 20, MAXFLOAT)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:[NSDictionary dictionaryWithObjectsAndKeys:kTitleFont,NSFontAttributeName, nil]
                                                     context:nil];
    NSLog(@"%f---%f---%f---%f",titleLabelRect.origin.x,titleLabelRect.origin.y,titleLabelRect.size.width,titleLabelRect.size.height);
    _titleF = CGRectMake(10, 15, kScreenWidth - 20, titleLabelRect.size.height);
    
    CGFloat titleLabelMaxY = CGRectGetMaxY(_titleF);
    
    
    //    CGSize timeLabelSize = [news.time sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kTimeFont,NSFontAttributeName, nil]];
    CGRect timeLabelRect = [news.newsTime boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:[NSDictionary dictionaryWithObjectsAndKeys:kTimeFont,NSFontAttributeName, nil] context:nil];
    
    _timeF = CGRectMake(20, titleLabelMaxY + 20, timeLabelRect.size.width, timeLabelRect.size.height);
    //    NSLog(@"timeF----%f-----%f----%f----%f",0.0,titleLabelMaxY, timeLabelRect.size.width,timeLabelRect.size.height);
    
    CGRect fromLabelRect = [news.newsFrom boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                                               options:NSStringDrawingUsesLineFragmentOrigin
                                                            attributes:[NSDictionary dictionaryWithObjectsAndKeys:kViewCountFont,NSFontAttributeName, nil]
                                                               context:nil];
    _fromF = CGRectMake(kScreenWidth - 20 - fromLabelRect.size.width,
                               _timeF.origin.y,
                               fromLabelRect.size.width,
                               fromLabelRect.size.height);
    
    //    NSLog(@"viewsCountF----%f-----%f----%f----%f",kScreenWidth - 20 - viewsCountLabelRect.size.width,_timeF.origin.y, viewsCountLabelRect.size.width,viewsCountLabelRect.size.height);
    
    
    _cellHeight = CGRectGetMaxY(_fromF) + 10;
    
}



@end
