//
//  NSArray+Util.m
//  XidianInfo
//
//  Created by Pasco on 16/3/5.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "NSArray+Util.h"

@implementation NSArray (Util)

- (NSArray *)map:(id (^)(id obj, NSUInteger idx))block {
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:block(obj, idx)];
    }];
    
    return [array copy];
}

- (NSMutableArray *)filter:(BOOL (^)(id obj, NSUInteger idx))block {
    NSMutableArray *array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (block(obj, idx)) {
            [array addObject:obj];
        }
    }];
    
    return array;
}

@end

@implementation NSMutableArray (Util)

- (void)prependArray:(NSArray *)array {
    NSMutableIndexSet *indexes = [NSMutableIndexSet indexSet];
    for (NSInteger index = 0; index < array.count; index++) {
        [indexes addIndex:index];
    }
    [self insertObjects:array atIndexes:indexes];
}

- (void)appendArray:(NSArray *)array {
    [self addObjectsFromArray:array];
}

@end
