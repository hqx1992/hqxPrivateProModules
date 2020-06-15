//
//  NSArray+SafeAccess.m
//  DispatchHelper
//
//  Created by hqx_1992_ on 2020/5/14.
//  Copyright © 2020 云路-研发一部-hqx. All rights reserved.
//

#import "NSArray+SafeAccess.h"

@implementation NSArray (SafeAccess)
- (id)safeObjectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@"can't get any object from an empty array");
        return nil;
    }
    if (index > self.count) {
        NSLog(@"index out of bounds in array");
        return nil;
    }
    return [self objectAtIndex:index];
}
@end


@implementation NSMutableArray (SafeAccess)

- (void)safeAddObject:(id)obj{
    if(nil == obj){
        NSLog(@"obj is nil");
        return;
    }
    [self addObject:obj];
}

- (void)safeRemoveObject:(id)obj {
    if (obj == nil) {
        NSLog(@"obj is nil");
        return;
    }
    [self removeObject:obj];
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index {
    if (self.count <= 0) {
        NSLog(@"can't get any object from an empty array");
        return;
    }
    if (index >= self.count) {
        NSLog(@"index out of bound");
        return;
    }
    [self removeObjectAtIndex:index];
}

- (void)safeInsertObject:(id)obj atIndex:(NSUInteger)index {
    if (obj == nil) {
        NSLog(@"can't insert nil into NSMutableArray");
        return;
    }
    if (index > self.count) {
        NSLog(@"index is invalid");
        return;
    }
    [self insertObject:obj atIndex:index];
}

- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if(self.count <= index){
        NSLog(@"index out of bound");
        return;
    }
    [self replaceObjectAtIndex:index withObject:anObject];
}

- (void)safeExchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2{
    if(self.count <= idx1 || self.count <= idx2){
       NSLog(@"index out of bound");
        return;
    }
    [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
}

@end
