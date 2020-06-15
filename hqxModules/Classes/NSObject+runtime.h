//
//  NSObject+runtime.h
//  DispatchHelper
//
//  Created by hqx_1992_ on 2020/6/12.
//  Copyright © 2020 云路-研发一部-hqx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (runtime)
/* 获取对象的所有属性 */
+(NSArray *)getAllProperties;
/* 获取对象的所有方法 */
+(NSArray *)getAllMethods;
/* 获取对象的所有属性和属性内容 */
+ (NSDictionary *)getAllPropertiesAndVaules:(NSObject *)obj;
@end

NS_ASSUME_NONNULL_END
