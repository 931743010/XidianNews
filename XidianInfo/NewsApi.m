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

- (NSString *)getUrlPathWithFilter:(NSString *)filter atPage:(NSInteger)pageIndex {
    NSString *urlPath = [APIBaseURL stringByAppendingString:@"newslist.php?newsType=%@&pageIndex=%ld&pageSize=20"];
    
//    @"newslist.php?newsType=%@&pageIndex=%ld&pageSize=20";
    return [NSString stringWithFormat:urlPath,filter,(long)pageIndex];
}

- (id)getXDXWNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:@"1010" atPage:pageIndex];
    return [self getNewsListByUrlPath:urlPath block:block];
}

- (id)getBKJXNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:@"1012" atPage:pageIndex];
    return [self getNewsListByUrlPath:urlPath block:block];
}

- (id)getYJSJXNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:@"1013" atPage:pageIndex];
    return [self getNewsListByUrlPath:urlPath block:block];
}

- (id)getKYXXNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:@"1014" atPage:pageIndex];
    return [self getNewsListByUrlPath:urlPath block:block];
}

- (id)getHZJLNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:@"1015" atPage:pageIndex];
    return [self getNewsListByUrlPath:urlPath block:block];
}

- (id)getXSGZNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:@"1016" atPage:pageIndex];
    return [self getNewsListByUrlPath:urlPath block:block];
}

- (id)getRSDTNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:@"1017" atPage:pageIndex];
    return [self getNewsListByUrlPath:urlPath block:block];
}

- (id)getBKZSNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:@"1018" atPage:pageIndex];
    return [self getNewsListByUrlPath:urlPath block:block];
}

- (id)getXSJYNewsList:(BaseResultBlock)block atPage:(NSInteger)pageIndex {
    NSString *urlPath = [self getUrlPathWithFilter:@"1019" atPage:pageIndex];
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















