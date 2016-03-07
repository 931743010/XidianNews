//
//  NewsApi.h
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "BaseApi.h"

@interface NewsApi : BaseApi

- (id)getNewsList:(BaseResultBlock)block newsType:(NSInteger)type atPage:(NSInteger)pageIndex;


@end
