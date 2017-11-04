//
//  LGCalendarModel.m
//  Calendar
//
//  Created by 郭武将 on 2017/5/21.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "LGCalendarModel.h"
#import "NSDate+Expand.h"

@implementation LGMonthModel

@end

@implementation LGDayModel

- (NSString *)lunarCalendarStr {
    NSString *dateString = [NSString stringWithFormat:@"%ld-%ld-%ld",self.yearForMonth,self.numForMonth,self.currentDayInMonth];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YY-MM-dd"];
    NSDate *date = [dateFormatter dateFromString:dateString];
    return [date nameOfDate];
}

@end
