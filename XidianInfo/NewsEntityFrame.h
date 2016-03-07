//
//  NewsEntityFrame.h
//  XidianInfo
//
//  Created by Pasco on 16/3/6.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class NewsEntityModel;
@interface NewsEntityFrame : NSObject

@property (nonatomic, strong) NewsEntityModel *news;

@property (nonatomic, assign, readonly) CGRect titleF;
@property (nonatomic, assign, readonly) CGRect fromF;
@property (nonatomic, assign, readonly) CGRect timeF;

@property (nonatomic, assign, readonly) CGFloat cellHeight;

@end
