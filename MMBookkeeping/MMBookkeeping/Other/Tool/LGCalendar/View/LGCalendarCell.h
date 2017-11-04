//
//  LGCalendarCell.h
//  Calendar
//
//  Created by 郭武将 on 2017/5/21.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LGDayModel;

static NSString *const LGCalendarCellIdentifier = @"LGCalendarCell";

typedef void (^notCurrentMonthDayBlcok)(BOOL isLastOrNext); //是否点击了不是本月的日期（上个月的或者下个月的）

@interface LGCalendarCell : UICollectionViewCell

@property (nonatomic ,strong) LGDayModel *dayModel;
@property (nonatomic ,strong) UIView *backView; //背景颜色
@property (nonatomic ,strong) UILabel *nomalDayLabel; //正常显示日期
@property (nonatomic ,strong) UILabel *lunarCalendarLabel; //农历
@property (nonatomic ,assign) BOOL isShowLunarCalendar; //是否显示农历

- (void)clickNotCurrentMonDay:(notCurrentMonthDayBlcok)block; //tOrNext); //是否点击了不是本月的日期（上个月的或者下个月的）

@end
