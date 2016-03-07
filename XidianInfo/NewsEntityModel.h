//
//  NewsEntityModel.h
//  XidianInfo
//
//  Created by Pasco on 16/3/6.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import <Realm/Realm.h>

@interface NewsEntityModel : RLMObject

@property (nonatomic, assign) NSInteger newsIdInAll;
@property (nonatomic, assign) NSInteger newsIdInType;
@property (nonatomic, copy) NSString *newsTitle;
@property (nonatomic, copy) NSString *newsTime;
@property (nonatomic, copy) NSString *newsFrom;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, copy) NSString *coverUrl;

+ (NSArray *)arrayOfEntitiesFromJson:(NSArray *)dataArray;


@end
