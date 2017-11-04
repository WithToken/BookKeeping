//
//  NSDate+Expand.h
//  Calendar
//
//  Created by 郭武将 on 2017/5/22.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Expand)

- (NSString *)nameOfDate;

+ (NSDate *)dateForNextMonth:(NSDate*)date;

+ (NSDate *)dateForLastMonth:(NSDate*)date;

+ (NSInteger)daysWithDate:(NSDate*)date;

+ (NSInteger)monthWithDate:(NSDate*)date;

+ (NSInteger)yearWithDate:(NSDate*)date;

+ (NSInteger)totalDaysWithMonth:(NSDate*)date;

+ (NSInteger)firstWeekDayOfMonth:(NSDate*)date;

@end
