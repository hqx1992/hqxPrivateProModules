//
//  CommonTools.h
//  DispatchHelper
//
//  Created by hqx_1992_ on 2020/5/18.
//  Copyright © 2020 云路-研发一部-hqx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



typedef NS_ENUM(NSInteger, ArbitraryCornerRadiusViewType) {
    /** 默认全角 */
    ArbitraryCornerRadiusViewTypeDefault = 0,
    /** 左上角 */
    ArbitraryCornerRadiusViewTypeTopLeft = 1,
    /** 右上角 */
    ArbitraryCornerRadiusViewTypeTopRight = 2,
    /** 左下角 */
    ArbitraryCornerRadiusViewTypeBottomLeft = 3,
    /** 右下角 */
    ArbitraryCornerRadiusViewTypeBottomRight = 4,
    /** 左上角和右上角 */
    ArbitraryCornerRadiusViewTypeTopLeftTopRight = 5,
    /** 左上角和左下角 */
    ArbitraryCornerRadiusViewTypeTopLeftBottomLeft = 6,
    /** 左上角和右下角 */
    ArbitraryCornerRadiusViewTypeTopLeftBottomRight = 7,
    /** 右上角和左下角 */
    ArbitraryCornerRadiusViewTypeTopRightBottomLeft = 8,
    /** 右上角和右下角 */
    ArbitraryCornerRadiusViewTypeTopRightBottomRight = 9,
    /** 左下角和右下角 */
    ArbitraryCornerRadiusViewTypeBottomLeftBottomRight = 10,
    /** 左上角和右上角和左下角 */
    ArbitraryCornerRadiusViewTypeTopLeftTopRightBottomLeft = 11,
    /** 左上角和右上角和右下角 */
    ArbitraryCornerRadiusViewTypeTopLeftTopRightBottomRight = 12,
    /** 左上角和左下角和右下角 */
    ArbitraryCornerRadiusViewTypeTopLeftBottomLeftBottomRight = 13,
    /** 右上角和左下角和右下角 */
    ArbitraryCornerRadiusViewTypeTopRightBottomLeftBottomRight = 14,
};

@interface CommonTools : NSObject
/**
 视图切任意方向圆角
 
 @param view 要切圆角的视图
 @param cornerRadius 圆角大小
 @param type 圆角类型
 */
+ (void)configArbitraryCornerRadiusView:(UIView *)view cornerRadius:(CGFloat)cornerRadius withType:(ArbitraryCornerRadiusViewType)type;

/**
 配置 label 的行间距
 
 @param label 要配置的 label
 @param font 要配置的 label 的字体大小
 @param lineSpace  行间距
 @param maxWidth 要展示的最大宽度
 */
+ (void)configPropertyWithLabel:(UILabel *)label font:(CGFloat)font lineSpace:(CGFloat)lineSpace maxWidth:(CGFloat)maxWidth;

/*!
 * @brief json格式字符串转数组
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+  (id)toArrayWithJsonString:(NSString *)jsonString;


/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/*!
 * @brief 把字典转换成JSON
 * @param dict 字典
 * @return 返回JSON
 */
+ (NSString *)convertToJsonData:(NSDictionary *)dict;



/**
 判断是否是真机
 @return 判断是否是真机
 */
+ (BOOL)ifNotPhone;



#pragma mark - 沙盒相关 -
// 往沙盒中存数据
+ (void)saveToUserDefaults:(id)object key:(NSString *)key;
//从沙盒中取数据
+ (id)getUserDefaultsWithKey:(NSString *)key;


#pragma mark - 时间相关 -
+ (NSString *)get1970timeString;

//获取当前时间戳  精确到毫秒
+ (NSString *)currentTimeStr;



/**
 获取当前时间戳

 @return 当前时间戳
 */
+ (long )getCurrentTimeInterval;

/**
 根据传入的时间戳返回N月后的时间戳

 @param timeStamp 传入的时间戳
 @param month N月
 @return N月后的时间戳
 */
+(long )getPriousorLaterDateFromDate:(long long)timeStamp withMonth:(int)month;


/**
 根据UIlabel的文字获取删除线

 @param LblText UIlabel上的文字
 @return 删除线
 */
+ (NSMutableAttributedString *)getDeleteLineWithString:(NSString *)LblText;


///获取当前活动的控制器
+ (UIViewController *)getCurrentActivityViewController;


/** 根据图片二进制流获取图片格式 */
+ (NSString *)imageTypeWithData:(NSData *)data;


//时间戳转换日期 formatter:格式
+ (NSString *)timeWithTimeIntervalString:(long long)time dateFormatter:(NSString *)formatter;



//判断一个字符串中是否都是数字
+ (BOOL)isAllNum:(NSString *)string;


#pragma mark - 比较版本号大小的方法
+ (BOOL)compareVesionWithServerVersion:(NSString *)version;

///获取文本MD5值（32位）
+(NSString*)getMD5:(NSString*) Text;
//把当前字符串转化为日期
+(NSDate *)dateFromString:(NSString *)dateString;
//把当前日期转化为字符串
+ (NSString *)stringFromDate:(NSDate *)date;
//把当前日期转化为到分的字符串
+ (NSString *)stringtoMinuteFromDate:(NSDate *)date;
//判断手机号码格式是否正确
+ (BOOL)availableMobile:(NSString *)mobile;
//获取某个日期 多少天之后的日期
+ (NSString *)dateFromAfterdays:(int )days withDate:(NSDate *)curDate;
//获取当前时间的年月日
+ (NSString *)dateStringFromNowDate;
//传入今日日期及距今的月份month
+ (NSDate*)getPriousorLaterDateFromDate:(NSDate*)date withBeforeMonth:(int)month;
//
+(CGFloat)getHeightWithTitle:(NSString *)title font:(UIFont*)font maxWidth:(CGFloat )width;

//获取当前日期的前几个小时的时间
+ (NSString *)takePreviousHourWithDateString:(NSString *)dateString previousHours:(int )hours;

//获取当前日期的多少分钟后的的时间
+ (NSString *)takeAfterMinutesWithDateString:(NSString *)dateString afterMinutes:(int )minutes;

//判断是否是整数或者小数
+ (BOOL)isNumberAnddecimals:(NSString *)string;

//项目需要分割时间 2020-07-25 10:00:00
+ (NSString *)dateFromTimeString:(NSString *)timestring;
+ (NSString *)timeFromTimeString:(NSString *)timestring;
//获取两个时间间隔天数
+(NSInteger)getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate;
@end

NS_ASSUME_NONNULL_END
