//
//  NSObject+Selector.h
//  PA_zhima
//
//  Created by 龙志辉(产险总部科技中心线上系统团队共同资源研发组) on 2019/9/20.
//  Copyright © 2019 gensee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Selector)
- (void)access_performSelector:(NSString *)selector;
- (void)access_performSelector:(NSString *)selector withObject:(id)object;
- (void)access_performSelector:(NSString *)selector withObject:(id)firstObject withObject:(id)secondObject;
@end
