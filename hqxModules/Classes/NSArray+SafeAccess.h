//
//  NSArray+SafeAccess.h
//  DispatchHelper
//
//  Created by hqx_1992_ on 2020/5/14.
//  Copyright © 2020 云路-研发一部-hqx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SafeAccess)
- (id)safeObjectAtIndex:(NSUInteger)index;
@end
@interface NSMutableArray (SafeAccess)

- (void)safeAddObject:(id)obj;

- (void)safeRemoveObject:(id)obj;

- (void)safeRemoveObjectAtIndex:(NSUInteger)index;

- (void)safeInsertObject:(id)obj atIndex:(NSUInteger)index;

- (void)safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

- (void)safeExchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

@end

NS_ASSUME_NONNULL_END
