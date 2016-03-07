//
//  NewsEntityModel.m
//  XidianInfo
//
//  Created by Pasco on 16/3/6.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "NewsEntityModel.h"
#import <YYModel.h>

@implementation NewsEntityModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"newsIdInAll" : @"id",
             @"newsIdInType" : @"newsid",
             @"newsTitle" : @"newstitle",
             @"newsTime" : @"newstime",
             @"newsFrom" : @"newsfrom",
             @"hasCover" : @"hascover",
             @"coverUrl" : @"coverurl",
             };
    
}

+ (NSArray<NSString *> *)requiredProperties {
    return @[@"newsIdInAll"];
}

+ (NSString *)primaryKey {
    return @"newsIdInAll";
}

+ (NSArray *)arrayOfEntitiesFromJson:(NSArray *)dataArray {
    NSError *error;
    NSMutableArray *arrayOfEntities = [NSMutableArray array];
    if (dataArray) {
        for (id item in dataArray) {
            NewsEntityModel *newsEntityModel = [NewsEntityModel yy_modelWithJSON:item];
            [arrayOfEntities addObject:newsEntityModel];
        }
    }
    if (error) {
        NSLog(@"Couldn't convert app infos JSON to ChoosyAppInfo models: %@", error);
        return nil;
    }
    return [arrayOfEntities copy];
}

@end
