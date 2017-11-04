//
//  LGCalendarCell.m
//  Calendar
//
//  Created by 郭武将 on 2017/5/21.
//  Copyright © 2017年 郭武将. All rights reserved.
//

#import "LGCalendarCell.h"
#import "LGCalendarModel.h"

#define CurrentDayColor [UIColor redColor]

@interface LGCalendarCell ()

@property (nonatomic ,copy)notCurrentMonthDayBlcok notMonDayBlock;

@end

@implementation LGCalendarCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = CGRectGetWidth(self.frame)/2;
        self.backgroundColor = [UIColor clearColor];
        [self setUp];
    }
    return self;
}

- (void)setUp {
    [self addSubview:self.backView];
    [self addSubview:self.lunarCalendarLabel];
    [self addSubview:self.nomalDayLabel];
}

- (void)clickNotCurrentMonDay:(notCurrentMonthDayBlcok)block {
    self.notMonDayBlock = block;
}

- (void)setDayModel:(LGDayModel *)dayModel {
    _dayModel = dayModel;
    if (!_dayModel) return;
    self.nomalDayLabel.text = [NSString stringWithFormat:@"%ld",(long)_dayModel.currentDayInMonth];
    self.lunarCalendarLabel.text = [_dayModel lunarCalendarStr];
    if (_dayModel.isDayInMonth) {
        //属于本月的日期
        if (_dayModel.isCurrentDay) {
            // 是否是本月的当天
            self.backgroundColor = [UIColor clearColor];
            self.userInteractionEnabled = YES;
            self.nomalDayLabel.textColor = [UIColor whiteColor];
            self.lunarCalendarLabel.textColor = [UIColor whiteColor];
            self.backgroundColor = CurrentDayColor;
        } else {
            //不是本月的当天
            self.backgroundColor = [UIColor clearColor];
            self.userInteractionEnabled = YES;
            self.nomalDayLabel.textColor = [UIColor blackColor];
            self.lunarCalendarLabel.textColor = [UIColor blackColor];
            self.backgroundColor = [UIColor whiteColor];
        }
    } else {
        //不属于本月的日期
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        self.nomalDayLabel.textColor = [UIColor lightGrayColor];
        self.lunarCalendarLabel.textColor = [UIColor lightGrayColor];
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    self.backView.bounds = (CGRect){0 ,0 ,width * 0.9 ,width * 0.9};
    self.backView.center = self.center;
    self.backView.layer.cornerRadius = CGRectGetWidth(self.backView.frame)/2;
    
    self.nomalDayLabel.frame = (CGRect){0 ,0.0 ,width ,height - 5.0 - 15.0};
    self.lunarCalendarLabel.frame = (CGRect){0 ,height - 22.0 ,width ,15.0};
    if (!self.isShowLunarCalendar) {
        self.lunarCalendarLabel.frame = CGRectZero;
    }
}

- (UIView *)backView {
    if (!_backView){
        _backView = [[UIView alloc]initWithFrame:CGRectZero];
        _backView.backgroundColor = [UIColor clearColor];
        _backView.clipsToBounds = YES;
    }
    return _backView;
}

- (UILabel *)nomalDayLabel {
    if (!_nomalDayLabel) {
        _nomalDayLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _nomalDayLabel.textAlignment = NSTextAlignmentCenter;
        _nomalDayLabel.font = [UIFont systemFontOfSize:14];
        _nomalDayLabel.backgroundColor = [UIColor clearColor];
        _nomalDayLabel.textColor = [UIColor blackColor];
    }
    return _nomalDayLabel;
}

- (UILabel *)lunarCalendarLabel {
    if (!_lunarCalendarLabel) {
        _lunarCalendarLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _lunarCalendarLabel.textAlignment = NSTextAlignmentCenter;
        _lunarCalendarLabel.font = [UIFont systemFontOfSize:9];
        _lunarCalendarLabel.backgroundColor = [UIColor clearColor];
        _lunarCalendarLabel.textColor = [UIColor blackColor];
    }
    return _lunarCalendarLabel;}
@end
