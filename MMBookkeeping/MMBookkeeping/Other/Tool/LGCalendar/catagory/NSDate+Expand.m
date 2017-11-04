//
//  NSDate+Expand.m
//  Calendar
//
//  Created by 郭武将 on 2017/5/22.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "NSDate+Expand.h"

@implementation NSDate (Expand)

-(NSString *)nameOfDate {
    NSArray *array = [[NSArray alloc] initWithObjects:@"初一", @"初二",@"初三",@"初四",@"初五",@"初六",@"初七",@"初八",@"初九",@"初十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十",@"廿一",@"廿二",@"廿三",@"廿四",@"廿五",@"廿六",@"廿七",@"廿八",@"廿九",@"三十",nil];
    NSInteger day = [self lunarCalendarFromDate];
    if (day == 1) {
        // 如果是第一天，返回当前农历的月份
        return [self nameOfMonth];
    } else {
        return [array objectAtIndex:(day-1)];
    }
}

/*
   根据date，得当前所对应的农历第几天
*/
- (NSInteger)lunarCalendarFromDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:self];
    return [components day];
}

/*
  取当前日期所在的农历月份
*/
- (NSString *)nameOfMonth {
    NSArray *array = [[NSArray alloc] initWithObjects:@"正月", @"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"腊月",nil];
    NSInteger month = [self indexOfdate];
    NSString *str = @"";
    if ([self isLeapMonth]) {
        // 闰月加前缀
        str = [NSString stringWithFormat:@"闰%@",[array objectAtIndex:(month - 1)]];
    } else {
        str = [array objectAtIndex:(month - 1)];
    }
    return str;
}

#pragma mark- 农历月份
/*
   当前date月份index
*/
- (NSInteger)indexOfdate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *components = [calendar components:NSCalendarUnitMonth fromDate:self];
    return [components month];
}
/*
   是否是闰月
*/
- (BOOL)isLeapMonth {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *componentsOne = [calendar components:NSCalendarUnitMonth fromDate:self];
    NSDateComponents *componentsTwo = [[NSDateComponents alloc] init];
    [componentsTwo setMonth:-1];
    NSDate *agoMonth = [calendar dateByAddingComponents:componentsTwo
                                                  toDate:self options:0];
    NSDateComponents *agoComponents = [calendar components:NSCalendarUnitMonth fromDate:agoMonth];
    return ([componentsOne month] == [agoComponents month]) ?YES:NO;
}

/*
 该月第一天星期几
 */
+ (NSInteger)firstWeekDayOfMonth:(NSDate*)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    components.day = 1;
    NSDate *firstDay = [calendar dateFromComponents:components];
    NSInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDay] - 1;
    return firstWeekday;
}

/*
 当天日期
 */
+ (NSInteger)daysWithDate:(NSDate*)date {
    NSDateComponents *components = [self currentDateComponents:NSCalendarUnitDay date:date];
    return components.day;
}

/*
 月份
 */
+ (NSInteger)monthWithDate:(NSDate*)date {
    NSDateComponents *components = [self currentDateComponents:NSCalendarUnitMonth date:date];
    return components.month;
}

/*
 年
 */
+ (NSInteger)yearWithDate:(NSDate*)date {
    NSDateComponents *components = [self currentDateComponents:NSCalendarUnitYear date:date];
    return components.year;
}

/*
 该月总天数
 */
+ (NSInteger)totalDaysWithMonth:(NSDate*)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

/*
  上一个月中间一天。用于取year，month
 */
+ (NSDate *)dateForLastMonth:(NSDate*)date {
    NSDateComponents *components = [self middleByDateComponents:date];
    if (components.month == 1) {
        components.month = 12;
        components.year -= 1;
    } else {
        components.month -= 1;
    }
    NSDate *lastDate = [[NSCalendar currentCalendar] dateFromComponents:components];
    return lastDate;
}

/*
 下一个月中间一天。用于取year，month
 */
+ (NSDate *)dateForNextMonth:(NSDate*)date {
    NSDateComponents *components = [self middleByDateComponents:date];
    if (components.month == 12) {
        components.month = 1;
        components.year += 1;
    } else {
        components.month += 1;
    }
    NSDate *nextDate = [[NSCalendar currentCalendar] dateFromComponents:components];
    return nextDate;
}

+ (NSDateComponents*)currentDateComponents:(NSCalendarUnit)calendarUnit date:(NSDate*)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar components:calendarUnit fromDate:date];
}

/*
 中间天
 */
+ (NSDateComponents *)middleByDateComponents:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    components.day = 15;
    return components;
}

@end
