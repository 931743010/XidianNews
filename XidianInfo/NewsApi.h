//
//  NewsApi.h
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "BaseApi.h"

@interface NewsApi : BaseApi

- (id)getXDXWNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex;
- (id)getBKJXNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex;
- (id)getYJSJXNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex;
- (id)getKYXXNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex;
- (id)getHZJLNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex;
- (id)getXSGZNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex;
- (id)getRSDTNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex;
- (id)getBKZSNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex;
- (id)getXSJYNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex;

@end
