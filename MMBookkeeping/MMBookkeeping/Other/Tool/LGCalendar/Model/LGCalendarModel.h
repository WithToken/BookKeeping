//
//  LGCalendarModel.h
//  Calendar
//
//  Created by 郭武将 on 2017/5/21.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LGDayModel;

@interface LGMonthModel : NSObject

@property (nonatomic ,assign) NSInteger totalDays; // 该月一共有多少天
@property (nonatomic ,assign) NSInteger weekFirstDay; //该月第一天星期几
@property (nonatomic ,assign) NSInteger yearForMonth; //该月是属于哪一年
@property (nonatomic ,assign) NSInteger numForMonth; //哪个月
@property (nonatomic ,assign) NSInteger currentDayInMonth; //该月当天（当天）

@end

@interface LGDayModel : LGMonthModel

@property (nonatomic ,assign) BOOL isCurrentDay; // 是否是当天
@property (nonatomic ,assign) BOOL isDayInMonth; // 是否是本月的日期

- (NSString *)lunarCalendarStr; //取农历

@end
