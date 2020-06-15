//
//  NSObject+Selector.m
//  PA_zhima
//
//  Created by hqx on 2019/9/20.
//  Copyright © 2019 gensee. All rights reserved.
//

#import "NSObject+Selector.h"

@implementation NSObject (Selector)

- (void)access_performSelector:(NSString *)selector {
    [self access_performSelector:selector withObject:nil withObject:nil];
}

- (void)access_performSelector:(NSString *)selector withObject:(id)object {
    [self access_performSelector:selector withObject:object withObject:nil];
}

-(void)access_performSelector:(NSString *)selector withObject:(id)firstObject withObject:(id)secondObject;
{
    if (!selector || [selector isEqualToString:@""]) return;
   NSLog(@"\n调用字符串方法：[%@ %@]", [self class], selector);
    if ([self respondsToSelector:NSSelectorFromString(selector)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:NSSelectorFromString(selector) withObject:firstObject withObject:secondObject];
#pragma clang diagnostic pop
    }
}


@end
