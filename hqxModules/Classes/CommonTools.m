//
//  CommonTools.m
//  DispatchHelper
//
//  Created by hqx_1992_ on 2020/5/18.
//  Copyright © 2020 云路-研发一部-hqx. All rights reserved.
//

#import "CommonTools.h"
#import "sys/utsname.h"
#import <CommonCrypto/CommonDigest.h>
@implementation CommonTools

#pragma mark -- 配置任意圆角的方法
+ (void)configArbitraryCornerRadiusView:(UIView *)view cornerRadius:(CGFloat)cornerRadius withType:(ArbitraryCornerRadiusViewType)type
{
    UIBezierPath *maskPath = [[UIBezierPath alloc] init];
    switch (type) {
        case ArbitraryCornerRadiusViewTypeDefault:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeBottomLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopLeftTopRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopLeftBottomLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopLeftBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopRightBottomLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopRightBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeBottomLeftBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopLeftTopRightBottomLeft:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomLeft cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopLeftTopRightBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopLeftBottomLeftBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        case ArbitraryCornerRadiusViewTypeTopRightBottomLeftBottomRight:
        {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds            byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        }
            break;
        default:
            break;
    }
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}


#pragma mark -- 配置 label 的属性【行间距】【要显示的最大宽度】
+ (void)configPropertyWithLabel:(UILabel *)label font:(CGFloat)font lineSpace:(CGFloat)lineSpace maxWidth:(CGFloat)maxWidth
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = size.height+1>font*2 ? lineSpace:0;
    NSRange range = NSMakeRange(0, [label.text length]);
    [attributedString addAttribute:NSBaselineOffsetAttributeName value:NSBaselineOffsetAttributeName range:range];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paraStyle range:range];
  
    label.attributedText = attributedString;
}




/*!
 * @brief json格式字符串转数组
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+  (id)toArrayWithJsonString:(NSString *)jsonString {
    
    if (jsonString == nil) {
        return nil;
    }
    
    NSError *err;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&err];
    if (jsonObject != nil && err == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
    
}



/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

/*!
 * @brief 把字典转换成JSON
 * @param dict 字典
 * @return 返回JSON
 */
+ (NSString *)convertToJsonData:(NSDictionary *)dict{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}



// 往沙盒中存数据
+ (void)saveToUserDefaults:(id)object key:(NSString *)key
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (standardUserDefaults) {
        if (![object isKindOfClass:[NSArray class]]) {
            
            if ([object isKindOfClass:[NSNull class]]) {
                [standardUserDefaults setObject:@"" forKey:key];
            }else {
                [standardUserDefaults setObject:object forKey:key];
            }
        }
    }
    [standardUserDefaults synchronize];
}

//从沙盒中取数据
+ (id)getUserDefaultsWithKey:(NSString *)key
{
    id returnObj = nil;
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        returnObj = [standardUserDefaults objectForKey: key];
    }
    return returnObj;
}


+ (NSString *)get1970timeString{
    return [NSString stringWithFormat:@"%lld",(long long)[[NSDate date] timeIntervalSince1970] * 1000];
}

//获取当前时间戳
+ (NSString *)currentTimeStr {
    
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

/**
 获取当前时间戳
 
 @return 当前时间戳
 */
+ (long )getCurrentTimeInterval {
    NSDate* datenow = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    return timeSp;
}

+(long )getPriousorLaterDateFromDate:(long long)timeStamp withMonth:(int)month{
    
    NSDate *date   = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];// NSGregorianCalendar
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    return [mDate timeIntervalSince1970];
}

//获取当前时间戳有两种方法(以秒为单位)
+(NSString *)getNowTimeTimestamp{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
//    //设置时区,这个对于时间的处理有时很重要
//    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}


/**
 根据UIlabel的文字获取删除线
 
 @param LblText UIlabel上的文字
 @return 删除线
 */
+ (NSMutableAttributedString *)getDeleteLineWithString:(NSString *)LblText {
    
    NSUInteger length = [LblText length];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:LblText];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, length)];
    return attri;
}


///获取当前活动的控制器
+ (UIViewController *)getCurrentActivityViewController {
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
//    NSLog(@"window level: %.0f", window.windowLevel);
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    
    //从根控制器开始查找
    UIViewController *rootVC = window.rootViewController;
    UIViewController *activityVC = nil;
    
    while (true) {
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            activityVC = [(UINavigationController *)rootVC visibleViewController];
        } else if ([rootVC isKindOfClass:[UITabBarController class]]) {
            activityVC = [(UITabBarController *)rootVC selectedViewController];
        } else if (rootVC.presentedViewController) {
            activityVC = rootVC.presentedViewController;
        } else {
            break;
        }
        
        rootVC = activityVC;
    }
    
    return activityVC;
}


//时间戳转换日期
+ (NSString *)timeWithTimeIntervalString:(long long)time dateFormatter:(NSString *)formatter {
    
    NSString *timeStr = [NSString stringWithFormat:@"%lld",time];
    
    if (timeStr.length == 13) {
        time = time / 1000.0;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (!formatter) {
        formatter = @"yyyy-MM-dd HH:mm:ss";
    }
    [dateFormatter setDateFormat:formatter];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

+ (BOOL)isAllNum:(NSString *)string{
    unichar c;
    for (int i=0; i<string.length; i++) {
        c=[string characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}

/** 根据图片二进制流获取图片格式 */
+ (NSString *)imageTypeWithData:(NSData *)data {
    uint8_t type;
    [data getBytes:&type length:1];
    switch (type) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            // R as RIFF for WEBP
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}


#pragma mark - 判断是否是真机
+ (BOOL)ifNotPhone {
    
//#ifdef DEBUG //处于开发阶段
#if defined(DEBUG) || defined(_DEBUG) //处于开发阶段

    return NO;
#else //处于上线阶段
    
    return TARGET_IPHONE_SIMULATOR ? YES : NO;
#endif
}





#pragma mark - 比较版本号大小的方法
+ (BOOL)compareVesionWithServerVersion:(NSString *)version {
    
    NSArray *versionArray = [version componentsSeparatedByString:@"."];//服务器返回版
    NSArray *currentVesionArray = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] componentsSeparatedByString:@"."];//当前版本
    
    if (currentVesionArray.count < 3 && versionArray.count < 3) return NO;
    
    
    NSInteger x0 = [[versionArray objectAtIndex:0] integerValue];
    NSInteger y0 = [[currentVesionArray objectAtIndex:0] integerValue];
    if (x0 > y0) return YES;
    
    NSInteger x1 = [[versionArray objectAtIndex:1] integerValue];
    NSInteger y1 = [[currentVesionArray objectAtIndex:1] integerValue];
    if ((x0 == y0) && (x1 > y1)) return YES;
    
    NSInteger x2 = [[versionArray objectAtIndex:2] integerValue];
    NSInteger y2 = [[currentVesionArray objectAtIndex:2] integerValue];
    if ((x0 == y0) && (x1 == y1) && (x2 > y2)) return YES;
    
    return NO;
}

+(NSString*)getMD5:(NSString*) Text
{
    if((nil == Text) || ([Text isEqualToString:@""]))
    {
        return nil;
    }
    const char *cStr = [Text UTF8String];//转换成utf-8
    
    unsigned char result[16];//开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
    /*
     
     extern unsigned char *CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
     
     把cStr字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了result这个空间中
     
     x表示十六进制，%02X  意思是不足两位将用0补齐，如果多余两位则不影响
     
     */
    
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],result[1],result[2],result[3],
            
            result[4],result[5],result[6],result[7],
            
            result[8],result[9],result[10],result[11],
            
            result[12],result[13],result[14],result[15]];
}

+(NSDate *)dateFromString:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}

+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
   // [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

+ (NSString *)stringtoMinuteFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
   // [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}

//判断手机号码格式是否正确
+ (BOOL)availableMobile:(NSString *)mobile{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        //[1][34578][0-9]{9}
//        NSString *CT_NUM = @"^(12[0-9]|13[0-9]|14[0-9]|15[0-9]|16[0-9]|17[0-9]|18[0-9]|19[0-9])[0-9]{8}$";
//        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
//        BOOL isMatch = [pred evaluateWithObject:mobile];
//
//        if (isMatch) {
//            return YES;
//        }else{
//            return NO;
//        }
        
        return true;
    }
}
+ (NSString  *)dateFromAfterdays:(int )days withDate:(NSDate *)curDate;
{
    //获取当前日期
       NSDate *currentDate = curDate;
     //获取7天后的日期
          // 指定日期声明
       NSTimeInterval oneDay = 24 * 60 * 60;  // 一天一共有多少秒
       NSDate *appointDate = [currentDate initWithTimeIntervalSinceNow: oneDay * days];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
      [formatter setDateFormat:@"yyyy-MM-dd"];
      //获取当前时间日期展示字符串 如：2019-05-23-13:58:59
      NSString *str = [formatter stringFromDate:appointDate];
        return str;
}
+( NSString *)dateStringFromNowDate
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //获取当前时间日期展示字符串 如：2019-05-23-13:58:59
    NSString *str = [formatter stringFromDate:date];
    return str;
}
+ (NSDate*)getPriousorLaterDateFromDate:(NSDate*)date withBeforeMonth:(int)month{

    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];// NSGregorianCalendar
    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    return mDate;

}
+(CGFloat)getHeightWithTitle:(NSString *)title font:(UIFont*)font maxWidth:(CGFloat )width
{
    UILabel* lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, MAXFLOAT)];
    lab.text = title;
    lab.font = font;
    lab.numberOfLines = 0;
    [lab sizeToFit];
    return lab.frame.size.height;
}

//获取当前日期的前几个小时的时间
+ (NSString *)takePreviousHourWithDateString:(NSString *)dateString previousHours:(int )hours;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

    NSDate *date = [dateFormatter dateFromString:dateString];
     NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setHour:hours];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];// NSGregorianCalendar

    NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
    
    return [dateFormatter stringFromDate:mDate];
   
}
//获取当前日期的多少分钟后的的时间
+ (NSString *)takeAfterMinutesWithDateString:(NSString *)dateString afterMinutes:(int )minutes;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
       [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];

       NSDate *date = [dateFormatter dateFromString:dateString];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
       [comps setMinute:minutes];
       NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];// NSGregorianCalendar

       NSDate *mDate = [calender dateByAddingComponents:comps toDate:date options:0];
       
       return [dateFormatter stringFromDate:mDate];
}


//判断是否是整数或者小数
+ (BOOL)isNumberAnddecimals:(NSString *)string;
{

           NSString *regex = @"^[0-9]+([.]{0,1}[0-9]+){0,1}$";
           NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
           return [pred evaluateWithObject:string];
}

//项目需要分割时间 2020-07-25 10:00:00
+ (NSString *)dateFromTimeString:(NSString *)timestring;
{
    if(timestring.length<12) return @"";
    NSArray *array = [timestring componentsSeparatedByString:@" "];
    if(array.count)
    {
        return array.firstObject;
    }
    
    return @"";
}
+ (NSString *)timeFromTimeString:(NSString *)timestring;
{
   if(timestring.length<12) return @"";
    NSArray *array = [timestring componentsSeparatedByString:@" "];
    if(array.count>=2)
    {
        NSString *str=[NSString stringWithFormat:@"%@",array.lastObject];
        return  str.length==8?array.lastObject:[NSString stringWithFormat:@"%@%@",array.lastObject,@":00"];
    }
    
    return @"";
}

//+ (NSInteger)calcDaysFromBegin:(NSString *)beginDate end:(NSString *)endDate;
//
//{
//    NSCalendar *gregorian = [[NSCalendar alloc]
//    initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//
//    [gregorian setFirstWeekday:2];
//    //去掉时分秒信息
//    NSDate *fromDate;
//    NSDate *toDate;
//    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:serverDate];
//    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:endDate];
//    NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
//
//    return dayComponents.day;
//
//
//}

+(NSInteger)getDaysFrom:(NSDate *)serverDate To:(NSDate *)endDate
{
NSCalendar *gregorian = [[NSCalendar alloc]
initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

[gregorian setFirstWeekday:2];
//去掉时分秒信息
NSDate *fromDate;
NSDate *toDate;
[gregorian rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:serverDate];
[gregorian rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:endDate];
NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];

return dayComponents.day;
}



@end
