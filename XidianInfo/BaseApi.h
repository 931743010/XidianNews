//
//  BaseApi.h
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

//#import <AFNetworking/AFNetworking.h>
#import <AFHTTPSessionManager.h>

typedef void (^ BaseResultBlock)(id data, NSError *error);
typedef void (^ BaseRequestSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^ BaseRequestFailureBlock)(NSURLSessionDataTask *task, NSError *error);
typedef void (^ BaseProgressBlock)(NSProgress *downloadProgress);

@interface BaseApi : AFHTTPSessionManager

@end
