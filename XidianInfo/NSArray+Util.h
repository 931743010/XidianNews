//
//  NSArray+Util.h
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Util)

- (NSArray *)map:(id (^)(id obj, NSUInteger idx))block;
- (NSMutableArray *)filter:(BOOL (^)(id obj, NSUInteger idx))block;

@end

@interface NSMutableArray (Util)

- (void)prependArray:(NSArray *)array;
- (void)appendArray:(NSArray *)array;

@end
