//
//  NewsApi.m
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "NewsApi.h"
#import "NewsEntityModel.h"

@implementation NewsApi

- (NSString *)getUrlPathWithFilter:(NSInteger)filter atPage:(NSInteger)pageIndex {
    NSString *urlPath = [APIBaseURL stringByAppendingString:@"newslist.php?newsType=%@&pageIndex=%ld&pageSize=20"];
    
//    @"newslist.php?newsType=%@&pageIndex=%ld&pageSize=20";
    return [NSString stringWithFormat:urlPath,filter,(long)pageIndex];
}

- (id)getNewsList:(BaseResultBlock)block newsType:(NSInteger)type atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:type atPage:pageIndex];
    return [self getNewsListByUrlPath:urlPath block:block];
}


- (id)getNewsListByUrlPath:(NSString *)urlPath block:(BaseResultBlock)block {
    BaseRequestSuccessBlock successBlock = ^(NSURLSessionDataTask * __unused task, id rawData) {
        NSMutableDictionary *data = [(NSDictionary *)rawData mutableCopy];
        NSArray *dataArray = [NewsEntityModel arrayOfEntitiesFromJson:data[@"data"]];
        if (block) {
            block(dataArray,nil);
        }
    };
    
    BaseRequestFailureBlock failureBlock = ^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    };
    

    return [[BaseApi manager] GET:urlPath
                       parameters:nil
                          success:successBlock
                          failure:failureBlock];
}

@end















