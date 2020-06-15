//
//  NSArray+Add.m
//  ZhiYuan
//
//  Created by zxw on 2019/5/26.
//  Copyright © 2019 张雄文. All rights reserved.
//

#import "NSArray+Add.h"

@implementation NSArray (Add)


-(NSArray*)removeArray:(NSArray*)aArray{
    
    NSMutableArray *mutArr = [[NSMutableArray alloc]initWithArray:self];
    
    NSIndexSet *indexes = [self indexesOfObjectsPassingTest:^BOOL(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
        return [aArray containsObject:obj];
    }];
    [mutArr removeObjectsAtIndexes:indexes];
    
    return mutArr;
}

@end
