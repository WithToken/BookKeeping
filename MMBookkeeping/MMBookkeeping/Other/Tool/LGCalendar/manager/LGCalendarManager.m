//
//  LGCalendarManager.m
//  Calendar
//
//  Created by 郭武将 on 2017/5/24.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "LGCalendarManager.h"
#import "NSDate+Expand.h"
#import "LGCalendarModel.h"

@implementation LGCalendarManager

+ (instancetype)defaultManager {
    static LGCalendarManager *stance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stance = [[LGCalendarManager alloc]init];
    });
    return stance;
}

- (void)dayArrayWithMonth:(NSInteger)month dayArrBlock:(daysArrayBlock)daysArrayBlock {
    NSArray *nearByMonths = [self lastCurrentNextModel:month];
    if (nearByMonths.count < 3) return;
    NSMutableArray *daysArray = [NSMutableArray arrayWithCapacity:2];

    LGMonthModel *lastModel = [nearByMonths objectAtIndex:0];//所要显示的上个月的日期
    LGMonthModel *nextModel = [nearByMonths objectAtIndex:2];//所要显示的本月日期
    LGMonthModel *currentModel = [nearByMonths objectAtIndex:1];//所要显示的下个月日期
    
    //第一天星期几（就遍历多少个model）
    NSInteger lastMonthDays = currentModel.weekFirstDay;
    //还剩多少天没有满一星期
    NSInteger numNotAWeek = (currentModel.totalDays - (7 - lastMonthDays)) % 7;
    //显示下一月天数
    NSInteger showNextMonthDays = 7 - (numNotAWeek != 0 ? numNotAWeek : 7);
    
    //所要显示上个月model
    for(int i = 0 ;i < lastMonthDays ;i ++) {
        LGDayModel *dayModel = [LGDayModel new];
        dayModel.isDayInMonth = NO;
        dayModel.isCurrentDay = NO;
        dayModel.yearForMonth = lastModel.yearForMonth;
        dayModel.numForMonth = lastModel.numForMonth;
        dayModel.currentDayInMonth = lastModel.totalDays-lastMonthDays + i + 1;
        [daysArray addObject:dayModel];
    }
    //获取本月model
    for (int i = 0 ;i < currentModel.totalDays ;i ++) {
        LGDayModel *dayModel = [[LGDayModel alloc]init];
        dayModel.isDayInMonth = YES;
        dayModel.yearForMonth = currentModel.yearForMonth;
        dayModel.numForMonth = currentModel.numForMonth;
        dayModel.currentDayInMonth = i + 1;
        //判断日期是否为当前日期
        dayModel.isCurrentDay = [self currentDayWithMonth:dayModel];
        [daysArray addObject:dayModel];
    }
    //显示下个月的model
    for(int i = 0 ;i < showNextMonthDays ;i ++) {
        LGDayModel *dayModel = [[LGDayModel alloc]init];
        dayModel.isDayInMonth = NO;
        dayModel.isCurrentDay = NO;
        dayModel.yearForMonth = nextModel.yearForMonth;
        dayModel.numForMonth = nextModel.numForMonth;
        dayModel.currentDayInMonth = i + 1;
        [daysArray addObject:dayModel];
    }
    daysArrayBlock(daysArray);
}

//判断日期是否为当前日期
- (BOOL)currentDayWithMonth:(LGDayModel *)dayModel{
    NSInteger day = [NSDate daysWithDate:[NSDate date]];
    NSInteger month = [NSDate monthWithDate:[NSDate date]];
    NSInteger year = [NSDate yearWithDate:[NSDate date]];
    if (dayModel.yearForMonth != year) {
        return NO;
    }
    if (dayModel.numForMonth != month) {
        return NO;
    }
    if (dayModel.currentDayInMonth != day) {
        return NO;
    }
    return YES;
}

- (NSArray *)lastCurrentNextModel:(NSInteger)month {
    NSDate *current = [NSDate date];
    NSDate *last = [NSDate dateForLastMonth:current];
    NSDate *next = [NSDate dateForNextMonth:current];
    if (month > 0) {
        //前翻
        for (int i = 0; i < month; i++) {
            // 每次遍历新值，用新值算date
            current = [NSDate dateForNextMonth:current];
            last = [NSDate dateForLastMonth:current];
            next = [NSDate dateForNextMonth:current];
        }
    } else {
        month = labs(month);//取绝对值，往后翻
        for (int i = 0; i < month; i++) {
            // 与上相反
            current = [NSDate dateForLastMonth:current];
            last = [NSDate dateForLastMonth:current];
            next = [NSDate dateForNextMonth:current];
        }
    }
    LGMonthModel *lastMonth = [self monthWithDate:last];
    LGMonthModel *currentMonth = [self monthWithDate:current];
    LGMonthModel *nextMonth = [self monthWithDate:next];
    return @[lastMonth,currentMonth,nextMonth];
}

- (LGMonthModel *)monthWithDate:(NSDate*)date{
    LGMonthModel *model = [[LGMonthModel alloc]init];
    model.totalDays = [NSDate totalDaysWithMonth:date];
    model.weekFirstDay = [NSDate firstWeekDayOfMonth:date];
    model.currentDayInMonth = [NSDate daysWithDate:date];
    model.numForMonth = [NSDate monthWithDate:date];
    model.yearForMonth = [NSDate yearWithDate:date];
    return model;
}
@end
